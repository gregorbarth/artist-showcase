class Category < ActiveRecord::Base
  
  has_and_belongs_to_many :pages

  validates :name, :presence => true
  
end
