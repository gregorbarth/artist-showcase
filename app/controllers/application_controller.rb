class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :twitter, :set_facebook_headers

  def twitter
    require "twitter"

    begin

      @tweets = Rails.cache.read(:tweets)

      if @tweets.blank?
        @tweets = Twitter.user_timeline(CenatusCms::Application::TWITTER_NAME, {:count => 3})
        Rails.cache.write(:tweets, @tweets, :expires_in => 10.minutes)
      end

    rescue Twitter::BadRequest => erl
      @tweets = Rails.cache.read(:tweets)
      logger.error("MSP rate limit exceeded: #{erl}")
    rescue Exception => e
      logger.error("MSP error fetch tweets: #{e}")
    end
  end

  def discogs
    require 'discogs'
    begin
      wrapper = Discogs::Wrapper.new()
      artist = wrapper.get_artist(CenatusCms::Application::DISCOGS_NAME)
      @releases = artist.releases
      puts "ANDI"
      puts @releases
    end
  end

  def songkick
    require 'songkickr'
    begin
      remote = Songkickr::Remote.new CenatusCms::Application::SONGKICK_API
      gigs = remote.events(:artist_name => CenatusCms::Application::SONGKICK_ARTIST_NAME)
      @gigs_by_month = gigs.results.group_by { |t| t.start.beginning_of_month }
    end
  end

  def set_facebook_headers
    @og_title = CenatusCms::Application::SITE_NAME
    @og_type = "website"
    @og_url = CenatusCms::Application::SITE_URL
    @og_image = CenatusCms::Application::SITE_LOGO
    @og_site_name = CenatusCms::Application::SITE_NAME
    @og_admins = CenatusCms::Application::FB_ADMIN
  end
end
