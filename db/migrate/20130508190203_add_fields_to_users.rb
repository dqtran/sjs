class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mentor, :boolean, :default => false
    add_column :users, :seeking, :boolean, :default => false
    add_column :users, :joining, :boolean, :default => false
  end
end
