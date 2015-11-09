class ClinicalTrialController < ApplicationController

  # This takes in the parameter userPIN, creates a patient object with
  # said pin from the database. It then finds all of the forms that the patient
  # should be taking and builds an array of them.
  def check_surveys
    message = ''
    survey_list = []

    begin
      patient = Patient.find_by_pin!(params[:userPIN])
    rescue ActiveRecord::RecordNotFound
      message = 'The PIN is invalid'
    rescue Exception
      message = 'Unexpected error'
    else
      if patient.date_started.nil?
        puts 'test'
        message = 'Your PIN is not active'
      elsif patient.date_completed < Time.now.utc
        puts 'test 2'
        message = 'Your PIN is not active'
      else
        clinical_trial = patient.clinical_trial

        if clinical_trial.nil?
          message = 'You are not participating in any clinical trials'
        else
          message = 'Success'

          # Get the form types for the patient in their current stage.
          pfs = patient.patient_forms.where('stage_number = ?', patient.current_stage)
          pfs.order('interval DESC')

          # Track if one of the surveys is weekly so that a daily survey is not
          # given on the same day as a weekly
          weekly = false
          weeklyins = nil

          pfs.each do |s|
            if weekly == false
              puts 'this is not a weekly survey '
              ins = FormInstanceHelper.next_due_at(patient, s.form_type_id)

              # Check if the patient can take the survey now or next time period
              if ins.start_time < Time.now.utc
                okay = true
              else
                okay = false
              end
              if ins.completed == false
                survey = {
                :surveyTitle => ins.form_type.name,
                :surveyInstanceID => ins.id,
                :nextDueAt => ins.start_time,
                :okayToStart => okay
                }
                survey_list.push(survey)
              end

              if s.interval = 604800
                puts 'weekly survey is set to true'
                weekly = true
                weeklyins = ins
              end
            else
              puts 'weekly survey is true'
              if ((weeklyins.start_time.to_date() === Time.now.utc.to_date()) and (s.form_type_id == 2))
                # do nothing
                #pooja - add code
                ins = FormInstanceHelper.next_due_at(patient, s.form_type_id)
                okay = false
                #pooja - add end
              else
                puts 'calling forminstance Helper for next_due_At function'
                ins = FormInstanceHelper.next_due_at(patient, s.form_type_id)
                if ins.start_time < Time.now.utc
                  okay = true
                else
                  okay = false
                end
                if ins.completed == false
                  survey = {
                  :surveyTitle => ins.form_type.name,
                  :surveyInstanceID => ins.id,
                  :nextDueAt => ins.start_time,
                  :okayToStart => okay
                  }
                  survey_list.push(survey)
                end

                if s.interval = 604800
                  puts 'weekly survey is set to true here!!'
                  weekly = true
                  weeklyins = ins
                end
              end
            end
          end
        end
      end
    end

    response = {
      :message => message,
      :surveys => survey_list
    }

    render json: response
  end
end
