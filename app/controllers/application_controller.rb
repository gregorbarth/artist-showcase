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
      @results = remote.events(:artist_name => CenatusCms::Application::SONGKICK_ARTIST_NAME)
      puts @results
    end
  end

  #### for use with HTTParty    ####
  #
  #def discogs
  #  hsh = Discogs.get_artist_releases().parsed_response
  #  releases_short = hsh["resp"]["artist"]["releases"]["release"]
  #  releases_short.push(hsh["resp"]["artist"]["releases"]["master"])
  #  puts releases_short[0]["role"]
  #  puts "ANDI1"
  #
  #  puts releases_short
  #
  #  releases_short.delete_if { |item| item["role"] != "Main"}
  #
  #  #master_releases = hsh["resp"]["artist"]["releases"]["master"].sort! { |a,b| b["year"] <=> a["year"] }
  #  #master_release_ids = []
  #  #for master_release in master_releases do
  #  #  if master_release["role"] == "Main"
  #  #    hsh_release = Discogs.get_release(master_release["id"])
  #  #    @releases.push(hsh_release["resp"]["release"])
  #  #    #master_release_ids <<
  #  #  end
  #  #end
  #
  #  ##hsh_releases = Discogs.get_release("342751")
  #  #puts "ANDI1"
  #  #
  #  #puts releases_short
  #  #puts "ANDI2"
  #  ##puts hsh_releases
  #
  #  #.limit(5)
  #  #@releases += hsh["resp"]["artist"]["releases"]["master"]
  #  #@releases.sort! { |a,b| b["year"] <=> a["year"] }
  #
  #end
  #
  ##def discogs
  ##  hsh = Discogs.get_artist_releases().parsed_response
  ##  @releases = hsh["resp"]["artist"]["releases"]["release"]
  ##  @releases += hsh["resp"]["artist"]["releases"]["master"]
  ##  @releases.sort! { |a,b| b["year"] <=> a["year"] }
  ##
  ##end


  def set_facebook_headers
    @og_title = CenatusCms::Application::SITE_NAME
    @og_type = "website"
    @og_url = CenatusCms::Application::SITE_URL
    @og_image = CenatusCms::Application::SITE_LOGO
    @og_site_name = CenatusCms::Application::SITE_NAME
    @og_admins = CenatusCms::Application::FB_ADMIN
  end
end

#
#### for use with HTTParty  ####
#
#class Discogs
#  include HTTParty
#  base_uri 'api.discogs.com'
#  headers 'Accept-Encoding' => 'gzip'
#  format :xml
#
#  def self.get_artist_releases()
#    get('/artist/'+CenatusCms::Application::DISCOGS_NAME, :query => {:releases => 1, :f => 'xml'})
#  end
#
#  def self.get_release(id)
#    get('/release/'+id, :query => {:f => 'xml'})
#  end
#
#end


