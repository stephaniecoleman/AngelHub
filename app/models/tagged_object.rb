class TaggedObject < ActiveRecord::Base
  belongs_to :tag, :counter_cache => :tagged_count
  belongs_to :taggable, :polymorphic => true

  # a tag can only be assigned to one object once
  validates :tag_id, :uniqueness => { :scope => [:taggable_type, :taggable_id] }
end
