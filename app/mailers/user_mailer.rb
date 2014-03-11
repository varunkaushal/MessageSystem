class UserMailer < ActionMailer::Base
  default from: 'admin@MessageService.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to Message Service')
  end
end
