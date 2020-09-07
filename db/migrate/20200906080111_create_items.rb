class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.string :condition, null: false
      t.string :burden, null: false
      t.string :area, null: false
      t.string :shipping_date, null:false
      t.integer :price, null: false
      # t.references :brand, foreign_key: true
      # t.references :category, foreign_key: true
      # t.references :user, foreign_key: true
      t.string :status, null: false
      t.timestamps
    end
  end
end
