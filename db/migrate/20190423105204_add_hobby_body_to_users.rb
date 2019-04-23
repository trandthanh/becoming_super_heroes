class AddHobbyBodyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hobby_body, :string
  end
end
