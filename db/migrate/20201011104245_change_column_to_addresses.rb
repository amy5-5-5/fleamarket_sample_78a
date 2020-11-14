class ChangeColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :post_code, :integer
    add_column :addresses, :zip_code, :integer
  end
end
