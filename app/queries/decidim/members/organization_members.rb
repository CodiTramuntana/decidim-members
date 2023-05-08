# frozen_string_literal: true

module Decidim
  module Members
    class OrganizationMembers < Decidim::Query
      def initialize(organization)
        @organization = organization
      end

      def query
        user_ids = Decidim::Verifications::Authorizations.new(organization: @organization, granted: true).pluck(:decidim_user_id).uniq
        Decidim::User.where(id: user_ids).not_deleted.no_active_invitation.order(name: :asc)
      end
    end
  end
end
