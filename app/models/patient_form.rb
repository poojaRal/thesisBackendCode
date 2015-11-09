class PatientForm < ActiveRecord::Base
  self.table_name = 'patient_forms'

  # relationship with clinical trial
  belongs_to :patient

  # relationship with form type
  belongs_to :form_type

  def self.create_new(form_id, patient_id, stage_number, default_interval)
    pf = PatientForm.new

    pf.patient_id = patient_id
    pf.form_type_id = form_id
    pf.stage_number = stage_number
    pf.interval = default_interval

    pf.save!
  end
end
