class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions

  validates :title, presence: true, uniqueness: {
    scope: :level,
    message: 'Название и уровень теста должны быть уникальны'
  }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_levels, ->(*levels) { where(level: levels) }
  scope :easy, -> { by_levels(0..1) }
  scope :medium, -> { by_levels(2..4) }
  scope :hard, -> { by_levels(5..Float::INFINITY) }

  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title) }
end
