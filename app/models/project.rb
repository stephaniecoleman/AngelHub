class Project < ActiveRecord::Base
  # establish the only valid values for status
  STATUS_OPTIONS = %w[ requested in_progress finished ] 
  enum :status => STATUS_OPTIONS

  belongs_to :organization
  has_many :developer_project
  has_many :developers, :through => :developer_project
  
  validates_presence_of :title, :repository, :description, :status
  validates :status, :inclusion => STATUS_OPTIONS

end
