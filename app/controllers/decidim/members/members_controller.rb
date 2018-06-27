# frozen_string_literal: true

module Decidim
  module Members
    class MembersController < Decidim::ApplicationController
      # protect_from_forgery with: :exception
      include NeedsPermission

      def index
        if current_user.present? && current_organization.enable_module_members?
          enforce_permission_to :read, Decidim::Members::User

          @members = MemberCollectionPresenter.new(
            organization: current_organization,
            page: params[:page].to_i,
            query: params[:q]
          ).attach_controller self
        else
          raise ActionController::RoutingError, 'Not Found'
        end
      end

      private

      def permission_class_chain
        [
          Decidim::Members::Permissions,
          Decidim::Permissions
        ]
      end

      def permission_scope
        :public
      end
    end
  end
end
