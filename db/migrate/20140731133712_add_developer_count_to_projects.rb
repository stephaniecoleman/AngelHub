class AddDeveloperCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :developer_count, :integer
  end
end
