class User < ApplicationRecord
  has_many :author_tests, foreign_key: :user_id, class_name: 'Test'
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :email, presence: true

  def test_list(*levels)
    tests.by_levels(levels)
  end
end
