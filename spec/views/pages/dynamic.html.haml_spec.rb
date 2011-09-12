require 'spec_helper'

describe "pages/dynamic.html.haml" do
  before :each do
    @section = mock_model(Page)
  end

  describe "simple render" do
    it "renders" do

      assign(:home_section, [])
      assign(:listen_section, [])
      assign(:biography_section, [])
      assign(:gigs_section, [])
      assign(:contact_section, [])

      render
      #puts "ANDI [#{rendered}]"
      rendered.should =~ /<section id='home'>/
      rendered.should =~ /<section id='listen'>/
      rendered.should =~ /<section id='biography'>/
      rendered.should =~ /<section id='gigs'>/
      rendered.should =~ /<section id='contact'>/
    end



  end
  #
  #describe "populated render" do
  #  before(:each) do
  #
  #    @asset_one = Asset.new(:name => "asset1")
  #    @section_one = Page.new(:name => "Home")
  #    Page.stub(:assets).and_return([@section_one])
  #
  #    #@project_two = Project.new(:title => "project two", :categories => [@cat])
  #
  #    assign(:home_section, [@section_one])
  #    #assign(:featured_projects, [@project_two])
  #
  #
  #    #@news_item_one = NewsItem.new(:title => "news item one")
  #    #@news_item_two = NewsItem.new(:title => "news item two")
  #    #
  #    #assign(:featured_news, [@news_item_one,@news_item_two])
  #
  #  end
  #
  #  it "renders with a landing section" do
  #    render
  #
  #    #rendered.should have_selector("div.exhibitions", :count => 2)
  #    #
  #    rendered.should =~ /<h2>/
  #    #rendered.should =~ /<h2>project one<\/h2>/
  #    #rendered.should have_content("project one")
  #    #
  #    #rendered.should =~ /<div class='exhibitions item small' data-category='.exhibitions'>/
  #    #rendered.should =~ /<h3>project two<\/h3>/
  #    #rendered.should have_content("project two")
  #    #
  #    #
  #    #rendered.should have_selector("div.article_lead")
  #    #
  #    #rendered.should =~ /<div class='article_lead item live white'>/
  #    #
  #    #rendered.should have_content("news item one")
  #    #rendered.should have_content("news item two")
  #    #rendered.should =~ /<h3>news item one<\/h3>/
  #    #rendered.should =~ /<h3>news item two<\/h3>/
  #    #
  #    #rendered.should have_selector("div#twitter")
  #
  #  end
  #
  #end
end
