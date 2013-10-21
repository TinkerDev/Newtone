class RecognitionController < ApplicationController

  def index

  end

  def file

  end

  def record

  end

  def recognize
    audio_path = params[:audio][:sample].tempfile.path
    file_ext = params[:audio][:sample].original_filename.split('.').last
    new_path = "#{Rails.root}/tmp/upload_tracks/#{Time.now.to_i.to_s}-#{rand(999999)}.#{file_ext}"
    FileUtils.cp(audio_path, new_path)
    result = Recognition.new(new_path).results
    FileUtils.rm(new_path)
    render :json => result
  end
end