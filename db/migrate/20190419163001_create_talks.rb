class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.datetime :schedule
      t.string :location
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
