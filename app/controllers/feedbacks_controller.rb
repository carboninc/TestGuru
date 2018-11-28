class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.contact_form(@feedback).deliver_now
      redirect_to root_path, notice: 'Письмо успешно отправлено!'
    else
      flash[:alert] = 'Что-то пошло не так!'
      redirect_to root_path
    end
  end

  private

  def feedback_params
    params.permit(:email, :message)
  end
end
