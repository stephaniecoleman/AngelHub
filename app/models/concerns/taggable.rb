module Taggable
  extend ActiveSupport::Concern


  included do
    include ArelHelpers::ArelTable
    include ArelHelpers::JoinAssociation

    has_many :tagged_objects, :as => :taggable, :dependent => :destroy
    has_many :tags, :through => :tagged_objects

    scope :tagged_as, -> (*tags) do
      tags.map { |tag|
        self.joins(:tags).where(tags: { name: tag})
      }.inject(&:&)
       # self.joins(:tags).where(tags: { name: 'Sanitation'}) & self.joins(:tags).where(tags: { name: 'Health'})
        
        # raise ArgumentError, 'no tags provided' if tags.empty?

      #  tags.inject(joins(:tags)) do |collection_proxy, tag|
      #   collection_proxy.where('tags.name = ?', tag)
      # end
    end
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