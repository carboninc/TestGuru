class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  SUCCESS_POINTS = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def percentage_success
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def test_passed?
    percentage_success >= SUCCESS_POINTS
  end

  def num_of_current_question
    test.questions.count - next_question.count
  end

  private

  def before_validation_set_question
    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              next_question.first
                            end
  end

  def correct_answer?(answer_ids)
    (correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort) &&
      correct_answers.count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
