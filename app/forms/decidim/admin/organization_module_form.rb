# frozen_string_literal: true

module Decidim
  module Admin
    # A form object used to update the current organization appearance from the admin
    # dashboard.
    #
    class OrganizationModuleForm < Form

      mimic :organization

      attribute :show_members_list, Boolean
      attribute :change_placeholder, Boolean    
    end
  end
end
