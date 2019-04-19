class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.references :wish, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
