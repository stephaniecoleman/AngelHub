module Taggable
  extend ActiveSupport::Concern


  included do

    has_many :tagged_objects, :as => :taggable, :dependent => :destroy
    has_many :tags, :through => :tagged_objects

    scope :tagged_as_any, lambda{ |*tags|
      joins(:tags).where(:tags => {:name => tags})
                  .group("#{table_name}.id")
    }

    scope :tagged_as_all, lambda{ |*tags|
      tagged_as_any(*tags).having('COUNT(tagged_objects.taggable_id) = ?', tags.count)
    }
  end

  def tag_as(*tags)
    tags.map! do |tag|
      if tag.is_a? Tag
        tag
      else
        tag.to_s.split(',').map do |t|
          Tag.find_by_name(t) || Tag.create(name: t)
        end
      end
    end
    self.tags << tags.flatten
  end

end