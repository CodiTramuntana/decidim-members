# frozen_string_literal: true

require 'rails'
require 'active_support/all'
require 'decidim/core'
require 'decidim/system'

module Decidim
  module Members
    module System
      # Decidim's core Rails Engine.
      class Engine < ::Rails::Engine
        isolate_namespace Decidim::Members::System
        engine_name 'decidim_members_system'

        initializer 'decidim_members_system.mount_routes' do |_app|
          Decidim::Core::Engine.routes do
            mount Decidim::Members::System::Engine => '/system'
          end
        end

        routes do
          resources :organization_members, only: %i[index edit update], controller: 'members'
        end

        initializer 'decidim_members_system.menu' do
          Decidim.menu :system_menu do |menu|
            menu.item I18n.t('menu.members', scope: 'decidim.system'),
                      decidim_members_system.organization_members_path,
                      position: 4,
                      active: :inclusive
          end
        end
      end
    end
  end
end
