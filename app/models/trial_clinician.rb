class TrialClinician < ActiveRecord::Base
  self.table_name = 'trial_clinicians'

  # relationship with clinical trial
  belongs_to :clinical_trial

  # relationship with clincian
  belongs_to :user

  def self.create_new(trial_id, clin_id)
    tc = TrialClinician.new

    tc.clinical_trial_id = trial_id
    tc.user_id = clin_id

    tc.save!
  end
end
