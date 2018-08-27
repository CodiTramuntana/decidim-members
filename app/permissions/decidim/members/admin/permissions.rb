# frozen_string_literal: true

module Decidim
  module Members
    module Admin
      class Permissions < Decidim::DefaultPermissions
        def permissions
          return permission_action unless user

          if permission_action.scope == :admin
            disallow!
            return permission_action
          end

          return permission_action unless user
        end
      end
    end
  end
end
