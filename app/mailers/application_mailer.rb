class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  #layout 'mailer'
  default_url_options[:host] = "localhost:3000"
end
