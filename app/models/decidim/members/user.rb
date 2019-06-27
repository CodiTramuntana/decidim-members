# frozen_string_literal: true

module Decidim
  module Members
    class User < Decidim::User
      def self.public_spaces
        not_deleted.no_active_invitation
      end
    end
  end
end
