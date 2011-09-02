class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :twitter, :set_facebook_headers
  
  def twitter
    require "twitter"
    # require "dalli"

    # cache = Dalli::Client.new 'mc5.ec2.northscale.net'
    begin
      @tweets = Twitter.user_timeline("mattspendlove", {:count => 4})
      # cache.set("shopsilverburn", @tweets) if @tweets && Rails.env != "production"
    # rescue Twitter::BadRequest  => erl
    #   if Rails.env != "production"
    #     @tweets = cache.get("shopsilverburn").first||default
    #     logger.error("MSP rate limit exceeded: #{erl}")
    # end
    rescue Exception => e
      logger.error("MSP error fetch tweets: #{e}")
    end
  end   

  def set_facebook_headers
    @og_title = "Cenatus CMS"
    @og_type = "website"
    @og_url = "http://somewhere.com"
    @og_image = "http://somewhere.com/images/home-logo.jpg"
    @og_site_name = "Cenatus CMS"
    @og_admins = "541838134"
  end
end
