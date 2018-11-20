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
      content_tag :div, sanitize(message), class: flash_class(key)
    end.join.html_safe
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email).downcase
    "https://s.gravatar.com/avatar/#{gravatar_id}.jpg?s=300"
  end

  private

  BOOTSTRAP_FLASH_CLASS_MAPPING = {
    'notice' => 'info',
    'success' => 'success',
    'error' => 'danger',
    'alert' => 'danger'
  }.freeze

  def flash_class(level)
    "alert alert-#{BOOTSTRAP_FLASH_CLASS_MAPPING[level]}"
  end
end
