# frozen_string_literal: true

# This decorator adds required associations between Decidim::User
require_dependency 'decidim/user'
Decidim::User.class_eval do
  include PgSearch::Model

  pg_search_scope :search_by_name_like, against: %i[name nickname],
                                        using: {
                                          tsearch: { prefix: true }
                                        }
end
