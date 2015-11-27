module ShoutsHelper
  def shouterize text
    link_hashtags(strip_tags(text)).html_safe
  end

  private
  def link_hashtags text
    # $1接收了\w+的值，这里注意，必须将\w+置于括号之中
    text.gsub(/#(\w+)/) { |match| link_to match, hashtag_path($1) }
  end
end
