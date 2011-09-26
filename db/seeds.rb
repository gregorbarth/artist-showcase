# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

phome = Page.create(:name => 'Home', :slug => 'home', :sort_order => 0)
ContentArea.create(:name => 'Introduction', :page_id => phome.id)
ContentArea.create(:name => 'Sidebar Area 1', :page_id => phome.id)
ContentArea.create(:name => 'Sidebar Area 2', :page_id => phome.id)

Page.create(:name => 'Listen', :slug => 'listen', :sort_order => 0)
Page.create(:name => 'Gigs', :slug => 'gigs', :sort_order => 0)
Page.create(:name => 'Biography', :slug => 'biography', :sort_order => 0)
Page.create(:name => 'Contact', :slug => 'contact', :sort_order => 0)

