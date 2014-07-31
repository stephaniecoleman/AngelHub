class Project < ActiveRecord::Base
  # establish the only valid values for status
  POSSIBLE_STATUSES = %w[ requested in_progress finished ] 
  enum :status => POSSIBLE_STATUSES

  belongs_to :organization
  has_many :developer_project
  has_many :developers, :through => :developer_project
  
  validates_presence_of :title, :description, :status

  # organizations must give their projects unique names
  validates :title, :uniqueness => { :scope => :organization_id }
  validates :status, :inclusion => POSSIBLE_STATUSES

  mount_uploader :project_pic, ProjectPicUploader

  def create_repo(params)
    OCTOKIT_CLIENT.create_repository(
  		params[:title], {
  				auto_init: true, 
  				description: params[:description],
  				homepage: params[:url]})
  end

end
