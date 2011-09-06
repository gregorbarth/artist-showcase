require 'spec_helper'

describe ApplicationController do

  controller do
    def index
      render :text => "I'm just a stub";
    end
  end

  describe "instance variables" do
    before :each do
      # Asset.stub!(:find).and_return(mock_model(Asset))
      # Asset.stub!(:find).and_return(mock_model(Asset))
    end
    
    it "assigns @og_title" do
      get 'index'
      assigns(:og_title).should_not be_nil
      assigns(:og_title).should eq(CenatusCms::Application::SITE_NAME)
    end

    it "assigns @og_type" do
      get 'index'
      assigns(:og_type).should_not be_nil
      assigns(:og_type).should eq("website")
    end

    it "assigns @og_url" do
      get 'index'
      assigns(:og_url).should_not be_nil
      assigns(:og_url).should eq(CenatusCms::Application::SITE_URL)
    end

    it "assigns @og_image" do
      get 'index'
      assigns(:og_image).should_not be_nil
      assigns(:og_image).should eq(CenatusCms::Application::SITE_LOGO)
    end

    it "assigns @og_site_name" do
      get 'index'
      assigns(:og_site_name).should_not be_nil
      assigns(:og_site_name).should eq(CenatusCms::Application::SITE_NAME)
    end

    it "assigns @og_admins" do
      get 'index'
      assigns(:og_admins).should_not be_nil
      assigns(:og_admins).should eq(CenatusCms::Application::FB_ADMIN)
    end

    it "assigns @tweets" do

      #require "twitter"

      get 'index'

      Rails.cache.clear
      Rails.cache.stub(:read).with(anything()).and_return(nil)
      #TODO unable to stub the API??
      #Twitter.stub(:user_timeline).with(CenatusCms::Application::TWITTER_NAME).and_return(nil)
      assigns(:tweets).should_not be_nil
    end

  end
end
