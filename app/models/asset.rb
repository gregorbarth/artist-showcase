class Asset < ActiveRecord::Base
  
  has_and_belongs_to_many :pages
  
  validates :name, :presence => true
  validates :description, :presence => true

  # has_attached_file :asset, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :bucket => 'virgin.s3.amazonaws.com', :path => ":attachment/:id/:style.:extension", :styles => { :medium => "120x120>", :thumb => "40x40>" }
  has_attached_file :asset, :styles => { :medium => "120x120>", :thumb => "40x40>" }
  
  attr_accessor :delete_image
  before_save { self.asset   = nil if self.delete_image == '1' }
  
  def asset_s3_url
    self.asset.url
  end

end
