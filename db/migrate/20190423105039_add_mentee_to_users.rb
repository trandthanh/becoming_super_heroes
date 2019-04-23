class AddMenteeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :mentee, foreign_key: true
  end
end
