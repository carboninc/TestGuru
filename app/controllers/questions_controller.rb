class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.pluck(:body)
    render plain: questions.join("\n")
  end

  def show
    render plain: @question.body
  end

  def create
    @question = @test.questions.create(question_params)
    if @question.save
      render plain: 'Вопрос создан'
    else
      render plain: 'Ошибка, не заполнены данные'
    end
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос удален'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Такой вопрос не найден.'
  end
end
