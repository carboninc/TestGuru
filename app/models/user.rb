class User < ApplicationRecord
  has_many :author_tests, foreign_key: :user_id, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  def test_list(*levels)
    tests.by_levels(levels)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
