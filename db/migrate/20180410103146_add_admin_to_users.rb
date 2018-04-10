class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end


#added new 'admin' column to users, to differentiate between admin and registered users