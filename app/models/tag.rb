class Tag < ActiveRecord::Base
  has_many :tagged_objects

  validates :name, :presence => true, :uniqueness => true
end
