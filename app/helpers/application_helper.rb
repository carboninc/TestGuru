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

  def flash_message
    flash.map do |key, message|
      content_tag :div, message, class: flash_class(key)
    end.join.html_safe
  end

  private

  def flash_class(level)
    case level
    when 'notice'
      'alert alert-info'
    when 'success'
      'alert alert-success'
    when 'error'
      'alert alert-danger'
    when 'alert'
      'alert alert-danger'
    end
  end
end
