class UserMailer < ActionMailer::Base
  default from: 'PainReport@noreply.com'
  def deliver_daily_email(user)
    @critical_patients = Patient.all.includes(:survey_results, :events)
    .where('patient.PIN = survey_result.PATIENT_ID AND patient.PIN = event.PATIENT_ID')
    mail(to: user[1], subject: 'Daily System Digest')
  end
end
