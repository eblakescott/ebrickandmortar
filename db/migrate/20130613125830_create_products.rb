class CreateProducts < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :title
      t.timestamps
    end    

    create_table :products do |t|
      t.belongs_to :store
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2
      t.integer :store_id

      t.timestamps
    end
  end
end
