class AddDeveloperCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :developer_count, :integer, default: 0
  end
end
