class GetBadgesService
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
    @test_passage = test_passage
  end

  def call
    Badge.select do |badge|
      rule = "reward_#{badge.rule}?"
      send(rule)
    end
  end

  private

  def reward_first_try?
    @test_passage.test_passed? && TestPassage.where(test: @test).count == 1
  end

  def reward_by_level?
    test = Test.find_by(level: @test.level)

    test.level == @test.level && Test.where(level: @test.level).count == completed_levels(@user, @test.level)
  end

  def reward_category?
    category = Category.find_by(title: @test.category.title)

    (category == @test.category) && (Test.where(category: category).count == completed_categories(@user, category))
  end

  def completed_categories(user, category)
    user.test_passages.by_category(category).group(:test).count.keys.size
  end

  def completed_levels(user, level)
    user.test_passages.by_level(level).group(:test).count.keys.size
  end
end
