class DeveloperProject < ActiveRecord::Base
  belongs_to :project, counter_cache: :developer_count
  belongs_to :developer

  after_create :change_status_of_project


  def change_status_of_project
    project.progress(:in_progress) if project.requested?
  end
end
