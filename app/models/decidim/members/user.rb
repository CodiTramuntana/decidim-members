# frozen_string_literal: true

module Decidim
  module Members
    class User < Decidim::User
      include Decidim::Participable
      include PgSearch

      pg_search_scope :search_by_name_like, against: %i[name nickname],
                                            using: { trigram: { threshold: 0.1 } }

      def self.public_spaces
        not_deleted.no_active_invitation
      end
    end
  end
end
