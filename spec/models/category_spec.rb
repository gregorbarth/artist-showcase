require 'spec_helper'

describe Category do
  it "can be instantiated" do
    Category.new.should be_an_instance_of(Category)
  end
  
  it "has many pages" do
    Category.reflect_on_association(:pages).should_not be_nil
    @category = Category.new
    @category.pages.length == 0
  end

  it "has a name that is required" do
    @category = Category.new
    @category.respond_to?(:name).should be_true
    @category.should_not be_valid
  end
                                            

end
