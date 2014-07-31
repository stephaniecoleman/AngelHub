class CreateCategorizedObjects < ActiveRecord::Migration
  def change
    create_table :categorized_objects do |t|
      t.belongs_to :categorizable, index: true, polymorphic: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
