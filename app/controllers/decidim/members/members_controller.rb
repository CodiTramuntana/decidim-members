# frozen_string_literal: true

module Decidim
  module Members
    class MembersController < Decidim::ApplicationController
      def index
        if current_user.present? && current_organization.enable_module_members?
          authorize! :read, Decidim::Members::User

          @members = MemberCollectionPresenter.new(
            organization: current_organization,
            page: params[:page].to_i,
            query: params[:q]
          ).attach_controller self
        else
          raise ActionController::RoutingError, 'Not Found'
        end
      end
    end
  end
end
