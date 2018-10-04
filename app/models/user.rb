class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def test_list(*levels)
    tests.where(level: levels)
  end
end
