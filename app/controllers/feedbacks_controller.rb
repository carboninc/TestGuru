class FeedbacksController < ApplicationController
  def index; end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.contact_form(@feedback).deliver_now
      redirect_to new_feedback_path, notice: 'Письмо успешно отправлено!'
    else
      flash[:alert] = 'Что-то пошло не так!'
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :message)
  end
end
