class Tag < ActiveRecord::Base
  has_many :tagged_objects, :dependent => :destroy
  had_many :tagged, :through => :tagged_objects, :source => :taggable

  validates :name, :presence => true, :uniqueness => true

  scope :similar_to, lambda{ |tag|
    where('name LIKE %?%', tag)
  }
end
