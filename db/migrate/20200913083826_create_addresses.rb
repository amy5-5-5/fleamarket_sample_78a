class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :zip_code
      t.string :prefecture
      t.string :city
      t.text :street
      t.references :user, null: false, foreign_key: true
      t.timestamps
      
    end
  end
end
