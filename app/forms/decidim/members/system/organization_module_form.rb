# frozen_string_literal: true

module Decidim
  module Members
    module System
      # A form object used to update the current organization appearance
      # from the admin dashboard.
      #
      class OrganizationModuleForm < Form
        mimic :organization

        attribute :enable_module_members, Boolean
        attribute :enable_placeholder_members, Boolean
      end
    end
  end
end
