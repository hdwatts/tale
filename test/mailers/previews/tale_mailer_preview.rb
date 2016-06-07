class TaleMailerPreview < ActionMailer::Preview
 def welcome_email_preview
   TaleMailer.welcome_email(User.first)
 end
end