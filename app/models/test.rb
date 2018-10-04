class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.by_category(category)
    joins(:category).where(categories: { title: category }).order('title DESC')
  end
end
