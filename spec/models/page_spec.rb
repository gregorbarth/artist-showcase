require 'spec_helper'

describe Page do
  it "can be instantiated" do
    Page.new.should be_an_instance_of(Page)
  end
  
  it "has many assets" do
    Page.reflect_on_association(:assets).should_not be_nil
    @page = Page.new
    @page.assets.length == 0
  end
    
  it "has many content_areas" do
    Page.reflect_on_association(:content_areas).should_not be_nil
    @page = Page.new
    @page.content_areas.length == 0
  end
    
  it "has many categories" do
    Page.reflect_on_association(:categories).should_not be_nil
    @page = Page.new
    @page.categories.length == 0
  end

  it "has a name that is required" do
    defined?(:name).should_not be_nil
    @page = Page.new
    @page.should_not be_valid
  end

  it "has a slug that is required" do
    defined?(:name).should_not be_nil
    @page = Page.new
    @page.should_not be_valid
  end

end
