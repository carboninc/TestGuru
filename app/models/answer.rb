class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true

  scope :correct_answer, -> { where(correct: true) }
end
