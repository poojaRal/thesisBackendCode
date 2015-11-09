# Assessment form
class FormType< ActiveRecord::Base
  self.table_name = 'form_types'

  # relationship with item types and questions
  has_many :item_types
  has_many :questions, through: :item_types, :uniq => true

  # relationship with clinical trial
  has_many :clinical_trials

  #relationship with patients
  has_many :patient_forms
  has_many :patients, through: :patient_forms

  # relationship between form and form instances
  has_many :form_instances
end
