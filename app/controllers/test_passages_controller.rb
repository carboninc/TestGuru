class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? || @test_passage.test_timer_over?
      badges = GetBadgesService.new(@test_passage).call

      if badges.present?
        current_user.badges.push(badges)
        names = badges.map(&:name).join(', ')
        flash[:notice] = "Вы получили награды: #{names}."
      end

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.html_url.present?
                      current_user.gists.create(question: @test_passage.current_question, gist_url: result.html_url)
                      { notice: t('.success', gist_url: result.html_url) }
                    else
                      { alert: t('.failed') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
