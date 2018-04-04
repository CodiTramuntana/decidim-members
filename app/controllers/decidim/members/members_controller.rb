# frozen_string_literal: true

module Decidim
  module Members

    class MembersController < Decidim::ApplicationController

      def index
        if current_user.present?
          authorize! :read, Decidim::Members::User

          @members = MemberCollectionPresenter.new(
            organization: current_organization,
            page: params[:page].to_i,
            query: params[:q]
          ).attach_controller self
        else
          raise ActionController::RoutingError.new('Not Found')
        end
      end
    end
  end
end
