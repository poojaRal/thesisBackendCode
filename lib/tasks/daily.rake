namespace :notifications do
  desc 'Sends notifications'
  task send: :environment do
    users = ActiveRecord::Base.connection.execute("SELECT * FROM users")
    for u in users
      UserMailer.deliver_daily_email(u).deliver
    end
  end
end
