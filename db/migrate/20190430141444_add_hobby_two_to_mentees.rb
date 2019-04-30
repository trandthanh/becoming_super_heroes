class AddHobbyTwoToMentees < ActiveRecord::Migration[5.2]
  def change
    add_column :mentees, :hobby_two, :string
  end
end
