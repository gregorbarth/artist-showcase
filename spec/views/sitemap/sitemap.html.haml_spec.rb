require 'spec_helper'

describe "sitemap/sitemap.builder" do
  it "renders the default attributes" do
    assign(:pages, [
        stub_model(Page, :name => "about", :slug => "about", :updated_at => Time.now),
        stub_model(Page, :name => "contact", :slug => "contact", :updated_at => Time.now)
    ])

    render :template => "sitemap/sitemap.builder"

    rendered.should have_xpath('//urlset[@xmlns="http://www.google.com/schemas/sitemap/0.84"]')
    rendered.should have_xpath("//urlset/url[loc=\"#{CenatusCms::Application::SITE_URL}\"]")
    rendered.should have_xpath("//urlset/url[loc=\"#{CenatusCms::Application::SITE_URL}about\"]")
    rendered.should have_xpath("//urlset/url[loc=\"#{CenatusCms::Application::SITE_URL}contact\"]")
  end

end
