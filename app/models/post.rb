class Post < ActiveRecord::Base
  attr_accessible :content, :posttype
  
  belongs_to :user
  
  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :posttype, :presence => true
  
  default_scope :order => 'posts.created_at DESC'
end
