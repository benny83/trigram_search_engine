class Country < ApplicationRecord
  scope :trgm_search, lambda { |query, coeff|
    where('similarity(name, ?) > ?', query, coeff).order(
      "similarity(name, #{ActiveRecord::Base.connection.quote(query)}) DESC"
    )
  }

  scope :text_search, ->(query) { trgm_search(query, 0.3) }
  scope :for_autocomplete, ->(query) { trgm_search(query, 0.1) }
end
