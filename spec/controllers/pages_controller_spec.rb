require 'spec_helper'

describe PagesController do

  before :each do
    @page = mock_model(Page, {:name => "page1", :slug => "page1"})
  end

  describe "GET 'dynamic'" do

    before :each do
      Page.stub_chain(:where, :limit, :first).and_return(@page)
    end


    it "should be successful" do
       get 'dynamic'
       response.should be_success
    end
  end  
    
end    
