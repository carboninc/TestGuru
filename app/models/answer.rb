class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def answers_count
    errors.add(:answers, 'У вопроса не может быть более 4 ответов') if question.answers.length >= 4
  end
end
