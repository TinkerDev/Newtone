module ButtonsHelper
  def select_audio_source_button type, url=nil
    case type
      when :record
        icon = 'mic'
        tooltip_text = I18n.t('audio_sources.recognize_record')
      when :file
        icon = 'upload'
        tooltip_text = I18n.t('audio_sources.recognize_file')
      when :new
        icon = 'cw'
        tooltip_text = I18n.t('recognize_new_track')
    end
    button = content_tag(:div, "#{fontello(icon, 'select-audio-button-icon')}".html_safe, :class => 'select-audio-source-button-link')
    tooltip = content_tag(:div, tooltip_text, :class => 'select-audio-source-button-caption')
    active_link_to( "#{button} #{tooltip}".html_safe, url)
  end
end