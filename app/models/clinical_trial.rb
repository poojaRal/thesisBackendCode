class ClinicalTrial < ActiveRecord::Base
  self.table_name = 'clinical_trials'

  # relationship with clinican overseeing it
  belongs_to :clinician, :class_name => 'User'

  # relationship with clinicians watching it
  has_many :trial_clinicians

  # relationship with form types it uses
  has_many :trial_forms
  has_many :form_types, through: :trial_forms

  # relationship with patients and form instances
  has_many :patients
  has_many :form_instances, through: :patients
end
