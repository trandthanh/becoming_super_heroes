class AddHobbyHeadToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hobby_head, :string
  end
end
