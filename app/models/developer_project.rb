class DeveloperProject < ActiveRecord::Base
  belongs_to :project, counter_cache: :developer_count
  belongs_to :developer
end
