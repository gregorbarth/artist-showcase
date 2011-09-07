class PagesController < ApplicationController

  
  def dynamic
    @landing_section = Page.where(:name => "Landing").first

    ##twitter()

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
