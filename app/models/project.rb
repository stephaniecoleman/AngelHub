class Project < ActiveRecord::Base
  # establish the only valid results for status
  STATUS_OPTIONS = %w[ requested in_progress finished ] 
  enum :status => STATUS_OPTIONS

  belongs_to :organization
  has_many :developer_project
  has_many :developers, :through => :developer_project
  
  validates_presence_of :title, :description, :status
  validates :status, :inclusion => STATUS_OPTIONS

  def create_repo(params)
  	OCTOKIT_CLIENT.create_repository(
  		title = params[:title], options = {
  				auto_init: true, 
  				description: params[:description],
  				homepage: params[:url]})
  end

end