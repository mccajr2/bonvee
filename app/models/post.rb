# == Schema Information
# Schema version: 20110713024426
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  posttype   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :content, :posttype
  
  belongs_to :user
  
  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :posttype, :presence => true
  
  default_scope :order => 'posts.created_at DESC'
  
  # Return posts from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

    # Return an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      following_ids = %(SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids}) OR user_id = :user_id",
            { :user_id => user })
    end
end
