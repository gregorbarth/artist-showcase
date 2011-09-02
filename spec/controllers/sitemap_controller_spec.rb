require 'spec_helper'

describe SitemapController do

  describe "GET 'sitemap'" do
    it "should be successful" do
      get 'sitemap'
      response.should be_success
    end

    it "should assign pages" do
      get 'sitemap'
      assigns(:pages).should_not be_nil
    end
  end
end