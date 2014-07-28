class Project < ActiveRecord::Base
  # establish the only valid results for status
  enum :status => [ :requested, :in_progress, :finished ]

  belongs_to :organization
  has_many :developer_project
  has_many :developers, :through => :developer_project
  
  before_save :initialize_status

  validates_presence_of :title, :repository, :description, :status
  validates :status, :inclusion => [ :requested, :in_progress, :finished ]

end
