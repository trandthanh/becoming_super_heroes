class AddWishHeadToWishes < ActiveRecord::Migration[5.2]
  def change
    add_column :wishes, :wish_head, :string
  end
end
