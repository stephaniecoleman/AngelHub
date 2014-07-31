module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tagged_objects, :as => :taggable, :dependent => :destroy
    has_many :tags, :through => :tagged_objects

    scope :tagged_as, lambda{ |*tags|
      raise ArgumentError, 'no tags provided' if tags.empty?
    }
  end

  def tag_as(*tags)
    tags.map! do |tag|
      if tag.is_a? Tag
        tag
      else
        tag = tag.to_s
        Tag.find_by_name(tag) || Tag.create(name: tag)
      end
    end
    self.tags << tags
  end

end