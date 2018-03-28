module Decidim
  module Members
    class User < Decidim::User
      include Decidim::Participable

      include PgSearch
      pg_search_scope :search_by_full_name, :against => [:name, :nickname], :using => [:tsearch, :trigram]

      def self.public_spaces
        #TODO only filtered
        all
        # published
      end

    end
  end
end
