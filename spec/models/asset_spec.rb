require 'spec_helper'

describe Asset do
  
  before :each do
    # Asset.stub!(:find).and_return(mock_model(Asset))
    # @asset = mock_model(Asset)
  end
  
  it "can be instantiated" do
    Asset.new.should be_an_instance_of(Asset)
  end                                           
  
  it "has many assets via paperclip" do
    Asset.new.asset.should_not be_nil
  end
  
  it "has many pages" do
    Asset.reflect_on_association(:pages).should_not be_nil
    @asset_assoc = Asset.new
    @asset_assoc.pages.length == 0
  end
  
  it "has a name that is required" do
    @asset = Asset.new
    @asset.respond_to?(:name).should be_true
    @asset.should_not be_valid
  end  
  
  it "has a description that is required" do
    @asset = Asset.new
    @asset.respond_to?(:description).should be_true
    @asset.should_not be_valid
  end

end
