module ButtonsHelper
  def select_audio_source_button type, url=nil
    case type
      when :record
        icon = 'mic'
        tooltip_text = I18n.t('audio_sources.recognize_record')
      when :file
        icon = 'upload'
        tooltip_text = I18n.t('audio_sources.recognize_file')
    end
    button = content_tag(:div, "#{fontello(icon, 'select-audio-button-icon')}".html_safe, :class => 'select-audio-source-button-link')
    tooltip = content_tag(:div, tooltip_text, :class => 'select-audio-source-button-caption')
    active_link_to( "#{button} #{tooltip}".html_safe, url)
  end

  def new_recognition_button
    button = content_tag(:div, "#{fontello('cw', 'select-audio-button-icon')}".html_safe, :class => 'select-audio-source-button-link')
    tooltip = content_tag(:div, I18n.t('recognize_new_track'), :class => 'select-audio-source-button-caption')
    active_link_to( "#{button} #{tooltip}".html_safe, 'javascript:showAudioSourceBlock()', :id=>:new_recognition)
  end
end