# frozen_string_literal: true

module Decidim
  module Members
    class Permissions < Decidim::DefaultPermissions
      def permissions
        return permission_action unless user
        return Decidim::Members::Admin::Permissions.new(user, permission_action, context).permissions if permission_action.scope == :admin

        if permission_action.scope == :public
          allow!
          return permission_action
        end
        return permission_action unless user
      end
    end
  end
end
