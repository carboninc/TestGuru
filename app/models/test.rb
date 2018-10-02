class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.by_category(category)
    category = Category.find_by title: category
    Test.all.where(category_id: category.id).order('title DESC')
  end
end
