class Track < ActiveRecord::Base
  include Noisia::Track
  #validates :author, :name, :fingerprint, :presence => true
  mount_uploader :file, TrackUploader

  def update_fingerprint
    self.fingerprint = Fingerprint.new(file.file.file).build
  end

  def self.seed
    songs = ['Без шансов', 'Гора', 'Деньги', 'Если бы', 'Кофевино', 'Похоронила', 'Река', 'Чайка', 'Жить В Твоей Голове', 'Кувырок']
    songs.map do |song|
      my_file = "/Users/unloved/Downloads/Земфира - #{song}.mp3"
      t=Track.new(:name=>song, :author=>'Земфира')
      t.file.store!(File.open(my_file))
      t.save
    end
  end

  def self.reseed
    Noisia::Elastic.recreate_index
    self.destroy_all
    self.seed
  end

end
