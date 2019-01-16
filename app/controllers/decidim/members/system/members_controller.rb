# frozen_string_literal: true

module Decidim
  module Members
    module System
      # Controller that allows managing the appearance of the organization.
      class MembersController < Decidim::System::ApplicationController
        helper_method :organization

        def index
          @organizations = Decidim::Organization.all
        end

        def edit
          @form = form(OrganizationModuleForm).from_model(organization)
        end

        def update
          @form = form(OrganizationModuleForm).from_params(params)

          UpdateOrganizationModule.call(organization.id, @form) do
            on(:ok) do
              flash[:notice] = I18n.t('members.update.success', scope: 'decidim.members.system')
              redirect_to organization_members_path
            end

            on(:invalid) do
              flash.now[:alert] = I18n.t('members.update.error', scope: 'decidim.members.system')
              render :edit
            end
          end
        end

        private

        def organization
          @organization ||= Decidim::Organization.find(params[:id])
        end
      end
    end
  end
end
