module Categorizable
  extend ActiveSupport::Concern

  included do
    has_many :categorized_objects, :as => :categorizable, :dependent => :destroy
    has_many :categories, :through => :categorized_objects

    scope :categorized_as_any, lambda{ |*categories|
      joins(:categories).where(:categories => {:name => categories}).group("#{table_name}.id")
    }

    scope :categorized_as_all, lambda{ |*categories|
      categorized_as_any(*categories).having('COUNT(categorized_objects.categorizable_id) = ?', categories.count)
    } 

    scope :category_search, ->(query) {
      joins(:categories).where('categories.name ILIKE ?', "%#{query}%")
    }
  end

end