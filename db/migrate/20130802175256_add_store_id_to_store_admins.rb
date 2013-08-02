class AddStoreIdToStoreAdmins < ActiveRecord::Migration
  def change
    add_column :store_admins, :store_id, :integer
  end
end
