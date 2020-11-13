class RenamePostCodeColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :post_code, :zip_code
  end
end
