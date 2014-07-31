class CategorizedObject < ActiveRecord::Base
  belongs_to :categorizable, :polymorphic => true
  belongs_to :category, :counter_cache => :categorized_count

  # a category can be only assigned once to a categorizable object
  validates_uniqueness_of :category_id, :scope => [:categorizable_type, :categorizable_id]
end
