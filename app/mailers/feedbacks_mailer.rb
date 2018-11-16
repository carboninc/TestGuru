class FeedbacksMailer < ApplicationMailer
  def contact_form(data)
    @email = data.email
    @message = data.message

    mail to: 'alastar.corr@yandex.kz'
  end
end
