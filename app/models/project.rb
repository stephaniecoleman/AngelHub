class Project < ActiveRecord::Base
  # model/concerns/taggable.rb
  # has established relationships, scopes, and helper methods for 
  # taggable models
  include Taggable

  # establish the only valid values for status
  POSSIBLE_STATUSES = %w[ requested in_progress finished ]
  enum :status => POSSIBLE_STATUSES

  belongs_to :organization
  has_many :developer_project, :dependent => :destroy
  has_many :developers, :through => :developer_project

  validates_presence_of :title, :description, :status

  # organizations must give their projects uniqueness names
  validates :title, :uniqueness => { :scope => :organization_id }
  validates :status, :inclusion => POSSIBLE_STATUSES
  
  # What is this?
  mount_uploader :project_pic, ProjectPicUploader

  # scopes:
  # popular
  scope :popular, lambda { |limit = 4|
    order(:developer_count => :desc).limit(limit)
  }
  # recent
  scope :recent, lambda { |limit = 4|
    order(:created_at => :desc).limit(limit)
  }
  # finished
  scope :success, lambda { |limit = 4|
    finished.shuffle.take(limit)
  }
  # featured (status: [0, 1]) indicates "in prog" and "req"
  scope :featured, lambda { |limit = 4|
    where(status: [0, 1]).shuffle.take(limit)
  }


  
  # increment the status of the project
  # requested => in_progress => finished
  #
  # takes an optional argument, if given it forces the project to have
  # the status implied by the argument
  #     progress(0)  # => status: :requested
  #     progress(1)  # => status: :in_progress
  #     progress(2)  # => status: :finished
  # or
  #     progress(:requested)    # => status: :requested
  #     progress(:in_progress)  # => status: :in_progress
  #     progress(:finished)     # => status: :finished
  def progress(status_code=nil)
    tap do |project|
      if status_code
        project.update(status: status_code)
      else
        project.increment(:status).save
      end
    end
  end


  
  def create_repo(params)
    OCTOKIT_CLIENT.create_repository(
  		params[:title], {
  				auto_init: true,
  				description: params[:description],
  				homepage: params[:url]})
  end

end
