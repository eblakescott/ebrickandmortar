class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :image_url

      t.timestamps
    end
  end
end
