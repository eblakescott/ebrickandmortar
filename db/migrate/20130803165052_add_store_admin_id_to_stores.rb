class AddStoreAdminIdToStores < ActiveRecord::Migration
  def change
    add_column :stores, :store_admin_id, :integer
  end
end
