class AddArtistToOrderitems < ActiveRecord::Migration[5.1]
  def change
    add_column :orderitems, :artist, :string
  end
end
