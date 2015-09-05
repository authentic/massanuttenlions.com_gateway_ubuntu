class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string, :null => false
    add_column :users, :first_name, :string, :null => false
    add_column :users, :last_name, :string, :null => false
    add_column :users, :spouse_first_name, :string
    add_column :users, :birthday, :date, :null => false
    add_column :users, :member_as_of, :string
    add_column :users, :biography, :text
    add_column :users, :street, :string, :null => false
    add_column :users, :house_number, :string, :null => false
    add_column :users, :postal_code, :string, :default => "22840", :null => false
    add_column :users, :city, :string, :default => "Massanutten", :null => false
    add_column :users, :state, :string, :default => "Virginia", :null => false
    add_column :users, :phone, :string, :null => false
    add_column :users, :status, :string, :default => "Active"
    add_column :users, :leadership, :string, :default => "Non"
    add_column :users, :officers, :string, :default => "Non"
    add_column :users, :webmaster, :string, :default => "Non"
    add_column :users, :newsletter_editor, :string, :default => "Non"
    add_column :users, :photographer, :string, :default => "Non"
    add_column :users, :signature, :string, :null => false
    add_index :users, :leadership
    add_index :users, :status
    add_index :users, :officers
    add_index :users, :webmaster
    add_index :users, :street
    add_index :users, :house_number
    add_index :users, :newsletter_editor
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :user_name, :unique => true
  end


end
