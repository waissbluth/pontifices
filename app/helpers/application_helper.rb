module ApplicationHelper
  def google_fonts_url(*fonts)
    "//fonts.googleapis.com/css?family=#{fonts.join('|')}"
  end
end
