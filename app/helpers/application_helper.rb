module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    content_tag(:a, repo, href: "https://github.com/#{author}/#{repo}", target: '_blank')
  end

  def github_url_profile(author, fullname)
    content_tag(:a, fullname, href: "https://github.com/#{author}", target: '_blank')
  end
end
