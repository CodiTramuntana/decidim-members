# frozen_string_literal: true

module Decidim
  module Members
    module System
      # Controller that allows managing the appearance of the organization.
      class MembersController < Decidim::System::ApplicationController

        def index

        end

        # def edit
        #   authorize! :update, current_organization
        #   @form = form(OrganizationAppearanceForm).from_model(current_organization)
        # end
        #
        # def update
        #   authorize! :update, current_organization
        #   @form = form(OrganizationAppearanceForm).from_params(params)
        #
        #   UpdateOrganizationAppearance.call(current_organization, @form) do
        #     on(:ok) do
        #       flash[:notice] = I18n.t("organization.update.success", scope: "decidim.system")
        #       redirect_to edit_organization_appearance_path
        #     end
        #
        #     on(:invalid) do
        #       flash.now[:alert] = I18n.t("organization.update.error", scope: "decidim.system")
        #       render :edit
        #     end
        #   end
        # end
      end
    end
  end
end
