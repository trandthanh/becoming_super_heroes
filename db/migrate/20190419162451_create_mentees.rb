class CreateMentees < ActiveRecord::Migration[5.2]
  def change
    create_table :mentees do |t|

      t.timestamps
    end
  end
end
