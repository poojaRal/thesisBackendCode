require 'date'
module FormInstanceHelper
  # check if survey is valid, true means valid, false means invalid
  def self.valid_survey(si)
    response = true
    time = Time.now.utc

    if si.end_time < time
      response = false
    elsif si.start_time > time
      response = false
    elsif si.completed == true
      response = false
    end
    puts response

    return response
  end

  # Extracted function to create a new form instance
  def self.create_new_instance(pat, form_id)

    type = FormType.find(form_id)
    pf = PatientForm.where('form_type_id = ? AND patient_id = ? AND stage_number = ?', form_id, pat.id, pat.current_stage)

    interval = pf.first.interval

    # calculate the start time and end time for the new instance
    # using the time since the patient started, and the interval of the form
    # type
    time_since = (Time.now.utc - pat.date_started).to_i
    time_start = time_since/interval
    time_end = time_start + 1

    stime = (pat.date_started + (time_start*interval))
    etime = (pat.date_started + (time_end*interval))

    newInstance = FormInstance.create_new(pat.id, form_id, stime, etime, false)
    return newInstance
  end

  # Get the next due date for a patient and form type
  def self.next_due_at(pat, form_id)
    current = pat.form_instances
    current = current.where('start_time < ?', Time.now.utc)
    current = current.where('end_time > ?', Time.now.utc)
    current = current.where('form_type_id = ?', form_id)

    response = nil

    if current.empty?
      puts 'current empty'
      s = FormInstanceHelper.create_new_instance(pat, form_id)
      response = s
    else
      puts 'current not empty'
      current = current.where('completed = ?', false)

      if current.empty?
        puts 'current completed'
      else
        puts 'current not completed'
        response = current.first()
      end
    end

    if response.nil?
      future = pat.form_instances
      future = future.where('start_time > ?', Time.now.utc)
      future = future.where('form_type_id = ?', form_id)

      if future.empty?
        # form = FormType.find(form_id)
        puts form_id.inspect
        puts 'creating new form_instance for above mentioned form_type_id'
        pf = PatientForm.where('form_type_id = ? AND patient_id = ?', form_id, pat.id)
        interval = pf.first.interval

        time_since = (Time.now.utc - pat.date_started).to_i
        time_start = (time_since/interval) + 1
        time_end = time_start + 1

        stime = (pat.date_started + (time_start*interval))
        etime = (pat.date_started + (time_end*interval))

        s = FormInstance.create_new(pat.id, form_id, stime, etime, false)
        response = s
      else
        #pooja - add code
        #response = future.first()
        puts 'comparing all future instances irrespective of form_type_id'
        future2 = pat.form_instances
        future2 = future2.where('start_time > ?', Time.now.utc)
        response = future2.min_by {|x| x.start_time}
        #pooja - add end
      end
    end

    return response
  end

  # Get the very next form instance due, iterates over all but keeps the
  # soonest due one
  def self.get_next(pat)
    response = nil
    stage_surveys = pat.form_types.where('stage_number = ?', pat.current_stage)
    for f in stage_surveys

      s = FormInstanceHelper.next_due_at(pat, f.id)

      if response.nil?
        response = s
      else
        if s.start_time < response.start_time
          response = s
        end
      end
    end

    return response
  end
end
