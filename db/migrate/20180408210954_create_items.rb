class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :reference_ID
      t.string :title
      t.string :artist
      t.string :genre
      t.date :release_date
      t.string :label
      t.string :image
      t.decimal :price

      t.timestamps
    end
  end
end
