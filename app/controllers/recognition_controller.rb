class RecognitionController < ApplicationController

  def index

  end

  def file

  end

  def record

  end

  def recognize
    audio_path = params[:track].tempfile.path
    file_ext = params[:track].original_filename.split('.').last
    new_path = "#{Rails.root}/tmp/upload_tracks/#{Time.now.to_i.to_s}-#{rand(999999)}.#{file_ext}"
    FileUtils.cp(audio_path, new_path)
    result = Recognition.new(new_path).recognize
    #FileUtils.rm(new_path)
    render :json => result
  end
end