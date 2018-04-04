# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module Members
    # Decidim's Members Rails Admin Engine.
    # There is nothing to administer, it's 'only provided since Decidim
    # requires it.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Members::Admin

      routes do
        resources :module_members
      end

      initializer "decidim_members.admin_menu" do
        Decidim.menu :admin_menu do |menu|
          menu.item I18n.t("menu.members", scope: "decidim.admin"),
                        decidim_admin_members.module_members_path,
                        icon_name: "members",
                        position: 12,
                        active: [%w(decidim/admin/organization/module-members), []],
                        if: can?(:read, current_organization)
        end
      end

    end
  end
end
