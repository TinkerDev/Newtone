module ButtonsHelper
  def select_audio_source_button type, url
    css_class = "select-audio-button-icon select-audio-button-#{type}"
    button = ''
    case type
      when :record
        button = content_tag(:div, "#{fontello('mic', css_class)}".html_safe, :class => 'select-audio-source-button-link')
        tooltip = content_tag(:div, I18n.t('audio_sources.recognize_record'), :class => 'select-audio-source-button-caption')
      when :file
        button = content_tag(:div, "#{fontello('upload', css_class)}".html_safe, :class => 'select-audio-source-button-link')
        tooltip = content_tag(:div, I18n.t('audio_sources.recognize_file'), :class => 'select-audio-source-button-caption')
      #when :new
      #  button = content_tag(:div, "#{fontello('cw', css_class)}".html_safe, :class => 'round-link')
      #  tooltip = content_tag(:div, I18n.t('recognize_new_track'), :class => 'select-audio-source-button-caption center-block')
      #  return link_to_function("#{button} #{tooltip}".html_safe, "screenState('welcome'); newtoneFace('normal');")
    end
    content_tag :li, :class => "select-audio-source-button" do
      active_link_to( "#{button} #{tooltip}".html_safe, url)
    end
  end
end