class AddApprovedToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :approved, :boolean, null: false, default: false
  end
end
