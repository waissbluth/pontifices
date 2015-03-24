module ApplicationHelper
  def google_fonts_url(*fonts)
    "//fonts.googleapis.com/css?family=#{fonts.join('|')}"
  end
  def boolean_icon(value)
    if value
      icon = 'ok'
      title = 'True'
    else
      icon = 'remove'
      title = 'False'
    end
    content_tag :i, nil, class: "glyphicon glyphicon-#{icon}", title: title
  end
end
