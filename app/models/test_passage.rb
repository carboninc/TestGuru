class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]
  before_save :mark_completed, on: :update

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
    test.questions.count - last_questions.count
  end

  def test_timer_over?
    end_of_test_time <= 0
  end

  def end_of_test_time
    test_timer - Time.current
  end

  def test_timer
    created_at + test.timer * 60
  end

  scope :by_level, ->(level) { joins(:test).where(tests: { level: level }) }
  scope :by_category, ->(category) { joins(:test).where(tests: { category: category }) }

  private

  def before_validation_set_question
    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              last_questions.first
                            end
  end

  def correct_answer?(answer_ids)
    (correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort) &&
      correct_answers.count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def last_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def mark_completed
    self.completed = completed? && test_passed?
  end
end
