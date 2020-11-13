class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mailing_name, :string              
    add_column :users, :mailing_name_kana, :string         
    add_column :users, :mailing_first_name, :string         
    add_column :users, :mailing_first_name_kana, :string      
  end
end
