xml.instruct!

xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do
  xml.url do
    xml.loc CenatusCms::Application::SITE_URL
    xml.lastmod w3c_date(Time.now)
    xml.changefreq "always"
  end

  #### News ####
  #@news_items.each do |news|
  #  xml.url do
  #    xml.loc "http://netaudiolondon.org/news/#{news.friendly_id}"
  #    xml.lastmod w3c_date(news.updated_at)
  #    xml.changefreq "weekly"
  #    xml.priority 0.9
  #  end
  #end

  #### page ####
  @pages.each do |page|
    xml.url do
      xml.loc "#{CenatusCms::Application::SITE_URL}#{page.slug}"
      xml.lastmod w3c_date(page.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.6
    end
  end

end
