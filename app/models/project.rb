class Project < ActiveRecord::Base
  # establish the only valid values for status
  POSSIBLE_STATUSES = %w[ requested in_progress finished ] 
  enum :status => POSSIBLE_STATUSES

  belongs_to :organization
  has_many :developer_project
  has_many :developers, :through => :developer_project
  
  validates_presence_of :title, :repository, :description, :status
  validates :status, :inclusion => POSSIBLE_STATUSES

end
