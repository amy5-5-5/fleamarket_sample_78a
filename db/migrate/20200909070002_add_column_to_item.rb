class AddColumnToItem < ActiveRecord::Migration[6.0]
  def change
    remove_columns :items, :condition, :burden, :area, :shipping_date
    add_column :items, :category_id, :integer
    add_column :items, :condition_id, :integer
    add_column :items, :burden_id, :integer
    add_column :items, :area_id, :integer
    add_column :items, :shipping_date_id, :integer
  end
end
