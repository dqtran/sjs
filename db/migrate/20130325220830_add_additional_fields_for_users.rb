class AddAdditionalFieldsForUsers < ActiveRecord::Migration
  def change
    add_column :users, :skills_desc, :string, :default => ""
    add_column :users, :profile_pic_path, :string, :default => ""
    add_column :users, :like_project_id, :string, :default => ""
  end
end
