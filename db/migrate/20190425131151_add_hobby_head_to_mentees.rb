class AddHobbyHeadToMentees < ActiveRecord::Migration[5.2]
  def change
    add_column :mentees, :hobby_head, :string
  end
end
