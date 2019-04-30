class AddHobbyOneToMentees < ActiveRecord::Migration[5.2]
  def change
    add_column :mentees, :hobby_one, :string
  end
end
