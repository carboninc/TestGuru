class User < ApplicationRecord
  has_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users

  def test_list(*levels)
    tests.where(level: levels)
  end
end
