class AddHobbyBodyToMentees < ActiveRecord::Migration[5.2]
  def change
    add_column :mentees, :hobby_body, :string
  end
end
