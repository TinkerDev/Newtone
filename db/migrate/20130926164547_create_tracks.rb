class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :author
      t.string :name
      t.text :fingerprint
      t.string :file

      t.timestamps
    end
  end
end
