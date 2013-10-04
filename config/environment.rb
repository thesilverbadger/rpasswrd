# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rpasswrd::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'azure_7536344dda63f26e08dbd81f5ed4e292@azure.com',
  :password => 'ord3ill6',
  :domain => 'tomwire.co.uk',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}