class Project < ActiveRecord::Base
  attr_accessible :description, :title, :category, :current_members, :looking_for, :image, :video_url, :project_url
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :description, presence: true, length: {maximum: 1000}
  default_scope order: 'projects.created_at DESC'
end
