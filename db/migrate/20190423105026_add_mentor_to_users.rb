class AddMentorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :mentor, foreign_key: true
  end
end
