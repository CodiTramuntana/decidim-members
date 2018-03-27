module Decidim
  module Members
    class User < Decidim::User
      include PgSearch
      pg_search_scope :search_by_full_name, :against => [:name, :nickname], :using => [:tsearch, :trigram]

    end
  end
end
