class AddChargeIdToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :charge_id, :integer
  end
end
