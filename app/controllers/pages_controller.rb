class PagesController < ApplicationController

  
  def dynamic
    @home_section = Page.where(:name => :Home).last
    @listen_section = Page.where(:name => :Listen).last
    @biography_section = Page.where(:name => :Biography).last
    @gigs_section = Page.where(:name => :Gigs).last
    @contact_section = Page.where(:name => :Contact).last

    twitter()
    discogs()

    #
    #slug= params[:slug].blank? ? "home" : params[:slug]
    #
    #@page = Page.where(:slug => slug).limit(1).first
    #
    #if @page.blank?
    #  raise ActiveRecord::RecordNotFound
    #end
    #
    #layout_name = @page.blank? ? "home" : @page.name.downcase
  end    
end
