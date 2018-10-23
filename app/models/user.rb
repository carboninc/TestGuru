class User < ApplicationRecord
  has_many :author_tests, foreign_key: :user_id, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true

  def test_list(*levels)
    tests.by_levels(levels)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
