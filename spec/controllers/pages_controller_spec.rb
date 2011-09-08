require 'spec_helper'

describe PagesController do

  before :each do
    @section = mock_model(Page)
  end

  describe "GET 'dynamic'" do

    before :each do
      Page.stub_chain(:where, :last).and_return(@section)
    end

    it "should be successful" do
       get 'dynamic'
       response.should be_success
    end

    it "assigns @home_section" do
      get 'dynamic'
      assigns(:home_section).should_not be_nil
      assigns(:home_section).should eq(@section)
    end

    it "assigns @listen_section" do
      get 'dynamic'
      assigns(:listen_section).should_not be_nil
      assigns(:listen_section).should eq(@section)
    end

    it "assigns @biography_section" do
      get 'dynamic'
      assigns(:biography_section).should_not be_nil
      assigns(:biography_section).should eq(@section)
    end

    it "assigns @gigs_section" do
      get 'dynamic'
      assigns(:gigs_section).should_not be_nil
      assigns(:gigs_section).should eq(@section)
    end

    it "assigns @contact_section" do
      get 'dynamic'
      assigns(:contact_section).should_not be_nil
      assigns(:contact_section).should eq(@section)
    end

  end  
    
end    
