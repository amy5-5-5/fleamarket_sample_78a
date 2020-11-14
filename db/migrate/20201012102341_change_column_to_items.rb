class ChangeColumnToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :user, foreign_key: true
    add_column :items, :buyer_id, :integer 
  end
end
