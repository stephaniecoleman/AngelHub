class ChangeProjectsStatusColumn < ActiveRecord::Migration
  def up
    remove_column :projects, :status
    add_column :projects, :status, :integer, :default => 0
  end

  def down
    remove_column :projects, :status
    add_column :projects, :status, :string
  end
end
