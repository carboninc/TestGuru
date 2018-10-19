module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to('TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank')
  end

  def github_url_profile(author, fullname)
    link_to(fullname, "https://github.com/#{author}", target: '_blank')
  end
end
