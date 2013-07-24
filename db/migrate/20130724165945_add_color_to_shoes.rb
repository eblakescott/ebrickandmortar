class AddColorToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :color, :string
    add_column :shoes, :size, :decimal, precision: 8, scale: 2
    add_column :shoes, :width, :string
  end
end
