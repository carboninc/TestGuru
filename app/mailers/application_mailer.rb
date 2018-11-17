class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <alastar.corr@yandex.kz>}
  layout 'mailer'
end
