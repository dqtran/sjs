class AddMultipleFilesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :title, :string, :null => false
    add_column :projects, :category, :string, :null => false
    add_column :projects, :image, :string, :default => ""
    add_column :projects, :video_url, :string, :default => ""
    add_column :projects, :project_url, :string, :default => ""
    add_column :projects, :looking_for, :string, :default => ""
    add_column :projects, :current_members, :string, :default => ""
    add_column :projects, :status, :string, :default => "created"
    rename_column :projects, :user_id, :owner_id
  end
end
