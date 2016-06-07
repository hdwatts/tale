class TaleMailer < ActionMailer::Base
  default from: 'taleusermailer@gmail.com'
  
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome!')
  end
end
