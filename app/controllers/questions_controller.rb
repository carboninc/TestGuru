class QuestionsController < ApplicationController
  def index
    render json: { questions: Question.all }
  end
end
