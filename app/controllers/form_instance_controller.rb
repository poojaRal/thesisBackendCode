class FormInstanceController < ApplicationController

  # This was a step in getting CORS to work properly, I do not know if it is
  # necessary so remove at your own risk.
  def options
  end

  # This is the second API service, it takes a surveyInstanceID parameter
  # and builds a formInstance object from the database.
  def get_survey
    message = ''
    questions = []
    sid = params[:surveyInstanceID]
    begin
      survey_instance = FormInstance.find(sid)
    rescue ActiveRecord::RecordNotFound
      message = 'Invalid survey instance ID'
    rescue Exception
      message = 'Unexpected Error'
    else
      if FormInstanceHelper.valid_survey(survey_instance) == true
        message = 'Success'

        # form list of objects that have a survey name and reading
        survey = survey_instance.form_type
        items = survey.item_types.order(question_order: :asc)

        # Iterate over the questions for the form type of the given form
        # instance. Put all of them into a list and send the list to the client.
        question_list = []
        items.each do |i|
          q = i.question
          answer_list = []
          q.answers.each do |a|
            opt = {:answerID => a.id, :answerText => a.text}
            answer_list.push(opt)
          end
          question = {
            :quesID => q.id,
            :questionType => q.qtype,
            :questionText => q.text,
            :answerOptions => answer_list
          }
          question_list.push(question)
        end
      else
        message = 'Survey has expired'
      end
    end

    # This just gets the interval for the form type.
    interval = survey_instance.patient.patient_forms.where('stage_number = ?', survey_instance.patient.current_stage)
    interval = interval.where('form_type_id= ?', survey_instance.form_type.id).first()

    response = {
      :surveyInstanceID => sid,
      :surveyName => survey_instance.form_type.name,
      :surveyFrequency => interval,
      :message => message,
      :questions => question_list
    }

    render json: response
  end

  # This is the third API service. It takes a surveyInstanceID as a parameter
  # and builds a formInstance object from the database.
  def submit_survey
    message = ''
    sid = params[:surveyInstanceID]
    begin
      survey_instance = FormInstance.find(sid)
      puts survey_instance.inspect
      #pooja - add code
      puts 'New code for submitting second instance on the same day'
      survey_instance2 = FormInstance.where('start_time = ? and form_type_id <> ?',survey_instance.start_time,survey_instance.form_type_id)
      puts survey_instance2.inspect
      #pooja - add end
    rescue ActiveRecord::RecordNotFound
      message = 'Invalid survey instance ID'
    rescue => e
      message = 'Unexpected Error'
    else
      time = params[:timeStamp]
      if FormInstanceHelper.valid_survey(survey_instance) == true
        message = 'Success'

        # parse through params and store data
        params['surveyResults'].each do |qa|
          qid = qa["quesID"]
          #pooja add start
          ans_ts = qa["ansTimeStamp"]
          unless ans_ts == 0 || ans_ts.nil?
           ans_ts = Time.at((ans_ts.to_i) / 1000.00) 
          end
          prev_ts = qa["prevTimeStamp"]
          unless prev_ts == 0 || prev_ts.nil?
           prev_ts = Time.at((prev_ts.to_i) / 1000.00)
          end
          next_ts = qa["nextTimeStamp"]
          unless next_ts == 0 || next_ts.nil?
           next_ts = Time.at((next_ts.to_i) / 1000.00)
          end
          #pooja - add end
          question = Question.find(qid)
          # Do different things depending on question type

          # It looks here like you can do multiple bodypain reports here,
          # but this actually will not produce valuable data.
          puts question.inspect
          if question.qtype == 'bodyPain'
            bp = qa["bodyPain"]
            bp.each do |b|
              location_value = b["location"]
              location = Answer.find_by_text(location_value)
              #pooja change number of params  
              #puts 'Checking timestamp value here'
              puts location_value.inspect
              puts location.inspect 
              SelectedAnswer.create_new(sid, qid, location.id, ans_ts, prev_ts, next_ts)

              if location_value != "No Answer"
                intensity_value = b["intensity"]
                intensity = Answer.find_by_text(intensity_value)
                #pooja - change number of params
                SelectedAnswer.create_new(sid, qid, intensity.id, ans_ts, prev_ts, next_ts)
              end
            end
          else
            puts 'Multi choice question'
            selected = qa["selectedOptions"]
            selected.each do |s|
              #pooja change number of params
              puts 'Inside selectedOptions'
	      puts s.inspect
              SelectedAnswer.create_new(sid, qid, s, ans_ts, prev_ts, next_ts)
            end
          end

          survey_instance.completed = true
          survey_instance.actual_submission_time = Time.now.utc
          survey_instance.save!

        end
        #pooja - add code
        if (survey_instance2)
          survey_instance2.each do |s2|
            s2.completed = true
            s2.save!
          end
          puts 'Second instance for the same day is also marked completed'
        end
        #pooja - add end
      else
        message = 'Error - Survey has expired'
      end
    end

    response = {
      :message => message
    }

    render json: response
  end
end
