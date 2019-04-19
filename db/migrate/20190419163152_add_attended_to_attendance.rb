class AddAttendedToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :attended, :boolean, null: false, default: false
  end
end
