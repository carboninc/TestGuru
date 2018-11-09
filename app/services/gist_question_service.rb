class GistQuestionService
  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: Rails.application.credentials.github[:access_token])
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "Вопрос теста: #{@test.title} сайта TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:title)
    content.join("\n")
  end
end
