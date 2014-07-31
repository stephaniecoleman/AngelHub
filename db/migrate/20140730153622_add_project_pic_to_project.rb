class AddProjectPicToProject < ActiveRecord::Migration
  def change
    add_column :projects, :project_pic, :string
  end
end
