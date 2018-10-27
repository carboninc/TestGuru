class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <noreply@testguru.com>}
  layout 'mailer'
end
