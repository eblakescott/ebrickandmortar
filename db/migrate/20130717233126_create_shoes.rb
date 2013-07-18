class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.belongs_to :store
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2
      t.string :sex
      t.integer :store_id

      t.timestamps
    end
  end
end
