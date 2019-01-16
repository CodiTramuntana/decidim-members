# frozen_string_literal: true

module Decidim
  module Members
    module System
      class UpdateOrganizationModule < Rectify::Command
        def initialize(id, form)
          @organization_id = id
          @form = form
        end

        # Executes the command. Broadcasts these events:
        #
        # - :ok when everything is valid.
        # - :invalid if the form wasn't valid and we couldn't proceed.
        #
        # Returns nothing.
        def call
          return broadcast(:invalid) if form.invalid?

          transaction do
            save_organization
          end

          broadcast(:ok)
        rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique
          broadcast(:invalid)
        end

        private

        attr_reader :form, :organization_id

        def organization
          @organization ||= Organization.find(organization_id)
        end

        def save_organization
          organization.enable_module_members = form.enable_module_members
          organization.enable_placeholder_members = form.enable_placeholder_members

          organization.save!
        end
      end
    end
  end
end
