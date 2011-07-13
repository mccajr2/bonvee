# == Schema Information
# Schema version: 20110713024426
#
# Table name: items
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  source      :string(255)
#  item_type   :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
  attr_accessible :name, :source, :item_type, :description
  
  validates :name, :presence => true
  validates :source, :presence => true
  validates :item_type, :presence => true
end
