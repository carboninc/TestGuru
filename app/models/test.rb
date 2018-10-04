class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions

  def self.by_category(category)
    joins(:category).where(categories: { title: category }).order('title DESC')
  end
end
