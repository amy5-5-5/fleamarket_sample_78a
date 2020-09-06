class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # t.string :name, null: false
      # t.integer :price, null: false
      # t.text :text, null:false
      # t.string :size
      # t.string :shipping_date, null:false
      # t.references :brand, foreign_key
      # t.references :category
      # t.references :user
      # t.timestamps
    end
  end
end
