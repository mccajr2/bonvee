require 'spec_helper'

describe Item do
  before(:each) do
    @attr = { :name => "Example Name", :source => "Example maker", 
      :item_type => "Example type", :description => "Example description" }
  end


  it "should create a new instance given valid attributes" do
    Item.create!(@attr)
  end

  it "should require a name" do
    no_name_item = Item.new(@attr.merge(:name => ""))
    no_name_item.should_not be_valid
  end
  
  it "should require a source" do
    no_source_item = Item.new(@attr.merge(:source => ""))
    no_source_item.should_not be_valid
  end
  
  it "should require a item_type" do
    no_type_item = Item.new(@attr.merge(:item_type => ""))
    no_type_item.should_not be_valid
  end
  
end
