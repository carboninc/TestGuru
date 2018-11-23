class Badge < ApplicationRecord
  enum rule: { no_rule: 0, category: 1, first_try: 2, by_level: 3 }

  validates :name, presence: true
  validates :image, presence: true
  validates :rule, presence: true

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
end
