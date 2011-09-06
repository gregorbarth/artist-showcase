require 'spec_helper'

describe ContentArea do
  it "can be instantiated" do
    ContentArea.new.should be_an_instance_of(ContentArea)
  end

  it "has a name that is required" do
    @content_area = ContentArea.new
    @content_area.respond_to?(:name).should be_true
    @content_area.should_not be_valid
  end

  it "belongs to Page" do
    ContentArea.reflect_on_association(:page).should_not be_nil
  end


end
