module ApplicationHelper
  def fontello icon, custom_class = ''
    #icon = case icon
    #  when 'wants' || 'want' || 'get' || 'wanted_items' then 'star'
    #  else icon
    #end
    content_tag :i, '', :class => "fontello-icon-#{icon} #{custom_class}"
  end

end
