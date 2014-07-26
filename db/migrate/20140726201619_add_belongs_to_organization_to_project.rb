class AddBelongsToOrganizationToProject < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.belongs_to :organization
    end
  end
end
