class Notifier < ActionMailer::Base
  default :from => 'signup@tomwire.co.uk'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def signup_email(user)
    @user = user
    @url  = 'https://secure.tomwire.co.uk/login'
    mail( :to => user.email,
    :subject => 'rpassword signup' )
  end
end