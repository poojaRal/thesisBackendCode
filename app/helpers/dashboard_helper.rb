module DashboardHelper

  # This is a function to extract the activation of a pin from the controller
  def self.activate_pin(trial)
    # retrieve a set of patients for the given trial who have not been activated
    # and who are not test patients.
    patients = trial.patients
    patients = patients.where(:date_started => nil)
    patients = patients.where(:test_patient => false)

    # get the first one, with the assumption that the first will have the
    # lowest pin
    patient = patients.first()

    if (patient.nil?)
      response = nil
    else
      time = Time.now.utc
      duration = patient.clinical_trial.duration

      patient.date_started = time
      patient.date_completed = (time + duration)
      patient.save!

      # create a new form instance for all of their forms immediately
      # TODO This should only be for their current stage, which should be 1
      # since they were just activated
      tfs = trial.trial_forms
      for tf in tfs
        PatientForm.create_new(tf.form_type_id, patient.id, tf.stage_number, tf.default_interval)
      end
    end

    return patient
  end

  # This is a function to extract the advancement of a stage from the controller
  def self.advance_stage(patient)
    trial = patient.clinical_trial

    if patient.current_stage > trial.stages
       puts 'patient stage is greater than total stages in the trial'
    else
      puts 'incrementing patient stage by 1'
      cs = patient.current_stage + 1
      patient.current_stage = cs
      patient.save!

      #
      instances = patient.form_instances.where('completed = ?',false)

      for f in instances
        f.completed = true
        f.save!
      end
    end
  end
end
