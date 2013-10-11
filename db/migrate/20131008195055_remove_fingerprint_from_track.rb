class RemoveFingerprintFromTrack < ActiveRecord::Migration
  def change
    remove_column :tracks, :fingerprint
  end
end
