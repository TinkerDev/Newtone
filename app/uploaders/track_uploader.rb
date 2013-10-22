# encoding: utf-8

class TrackUploader < CarrierWave::Uploader::Base
  after :store, :delete_old_tmp_file

  storage :file

  def store_dir
    "tracks/"
  end

  # remember the tmp file
  def cache!(new_file)
    super
    @old_tmp_file = new_file
  end

  def delete_old_tmp_file(dummy)
    @old_tmp_file.try :delete
  end
end
