class AddSicknessToMentees < ActiveRecord::Migration[5.2]
  def change
    add_column :mentees, :sickness, :string
  end
end
