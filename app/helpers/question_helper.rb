module QuestionHelper
  def question_header(question)
    if question.persisted?
      "Редактирование вопроса: #{question.body}"
    else
      "Создание вопроса для теста: #{question.test.title}"
    end
  end
end
