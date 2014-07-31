class Category < ActiveRecord::Base
  has_many :categorized_objects, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
end
