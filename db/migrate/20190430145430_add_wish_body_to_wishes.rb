class AddWishBodyToWishes < ActiveRecord::Migration[5.2]
  def change
    add_column :wishes, :wish_body, :string
  end
end
