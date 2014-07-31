class CreateTaggedObjects < ActiveRecord::Migration
  def change
    create_table :tagged_objects do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :taggable, index: true
      t.string :taggable_type

      t.timestamps
    end
  end
end
