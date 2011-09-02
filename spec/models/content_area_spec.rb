require 'spec_helper'

describe ContentArea do
  it "can be instantiated" do
    ContentArea.new.should be_an_instance_of(ContentArea)
  end

  it "has a name that is required" do
    defined?(:name).should_not be_nil
    @content_area = ContentArea.new
    @content_area.should_not be_valid
  end

end
