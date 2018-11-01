class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :author_tests, foreign_key: :user_id, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  def test_list(*levels)
    tests.by_levels(levels)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
