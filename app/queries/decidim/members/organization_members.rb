# frozen_string_literal: true

module Decidim
  module Members
    class OrganizationMembers < Rectify::Query
      def initialize(organization)
        @organization = organization
      end

      def query
        # Decidim::Authorization.where(granted: true).joins(:user).where(decidim_users: { decidim_organization_id: @organization.id })
        Decidim::Members::User.where(organization: @organization).not_deleted.no_active_invitation.order(name: :asc)
        # @organization.users.not_deleted.no_active_invitation.order(name: :asc)
      end
    end
  end
end
