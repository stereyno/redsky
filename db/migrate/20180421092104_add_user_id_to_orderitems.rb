class AddUserIdToOrderitems < ActiveRecord::Migration[5.1]
  def change
    add_column :orderitems, :user_id, :integer
  end
end
