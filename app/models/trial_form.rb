class TrialForm < ActiveRecord::Base
  self.table_name = 'trial_forms'

  # relationship with clinical trial
  belongs_to :clinical_trial

  # relationship with form type
  belongs_to :form_type
end
