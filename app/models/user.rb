class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # relationship with overseeing clinical trial
  has_many :clinical_trials, :foreign_key => :clinician_id

  # relationship with watching clinical trials
  has_many :trial_clinicians

  def self.create_new(email, password)
    clinician = User.new

    clinician.email = email
    clinician.password = password

    clinician.save!
  end
end
