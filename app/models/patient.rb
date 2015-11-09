# Patients using the software
class Patient < ActiveRecord::Base
  require 'date'

  self.table_name = 'patients'

  # relationship with form instance and selected answers
  has_many :form_instances
  has_many :selected_answers, through: :form_instances

  # relationship with form types
  has_many :patient_forms
  has_many :form_types, through: :patient_forms

  # relationship with clinical trial
  belongs_to :clinical_trial
end
