class SitemapController < ApplicationController

  layout nil
  
  def sitemap
    @pages = Page.all(:order => "updated_at DESC")
  end
end
