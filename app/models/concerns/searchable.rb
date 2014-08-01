module Searchable
	extend ActiveSupport::Concern

  included do
    # helper to build complex sql querries
    include ArelHelpers::ArelTable

    # does a derived search on the ActiveRecord::Relation object
    scope :search, lambda { |query, group_method = :union, search_using = nil|
      # default search params set by ::search_by
      search_using ||= searches_on

      # normalize the group method
      group_method = case group_method
                     when :intersect, :set, :&
                       [:intersect]
                     when :union, :|
                       [:union]
                     else
                       raise ArgumentError, "#{group_method} is not a valid group method. Choose either :union, :set or :intersect"
                     end

      # gather queries
      queries = search_using.map do |arg|
        if respond_to?(scope_name = "#{arg}_search")
          [scope_name, query]
        else
          [:where, "#{arg} ILIKE ?", "%#{query}%"]
        end
      end

      queries.inject(nil) do |past_q, current_q|
        if past_q
          # create UNION or INTERSECTION using
          concatenated_search = past_q.send(*group_method, send(*current_q))
          # get the results back as active record objects
          self.from(self.arel_table.create_table_alias(concatenated_search, table_name))
        else
          send(*current_q)
        end
      end

    }
  end

	module ClassMethods

		def search_by *by
      self.define_singleton_method :searches_on, ->{ by }
    end
    
	end

end