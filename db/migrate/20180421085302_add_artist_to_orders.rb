class AddArtistToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :artist, :string
  end
end
