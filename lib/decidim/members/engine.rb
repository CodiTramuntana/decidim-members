# frozen_string_literal: true

require 'rails'

require 'decidim/core'
require 'sanitize'
require 'pg_search'

module Decidim
  module Members
    # Decidim's Members Rails Engine.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Members
      engine_name 'decidim_members'

      initializer 'decidim_members.mount_routes' do |_app|
        Decidim::Core::Engine.routes do
          mount Decidim::Members::Engine => '/members'
        end
      end

      # make decorators autoload in development env
      config.autoload_paths << File.join(
        Decidim::Members::Engine.root, 'app', 'decorators', '{**}'
      )

      # make decorators available to applications that use this Engine
      config.to_prepare do
        Dir.glob(Decidim::Members::Engine.root + 'app/decorators/**/*_decorator*.rb').each do |c|
          require_dependency(c)
        end
      end

      routes do
        root to: 'members#index', as: :members
      end

      initializer 'decidim.stats' do
        Decidim.stats.register :members_count, priority: StatsRegistry::HIGH_PRIORITY do |organization, _start_at, _end_at|
          if organization.enable_module_members?
            user_ids = Decidim::Verifications::Authorizations.new(organization: organization, granted: true).pluck(:decidim_user_id).uniq
            Decidim::Members::User.where(id: user_ids).public_spaces.count
          else
            0
          end
        end
      end

      initializer 'decidim_members.menu' do
        Decidim.menu :menu do |menu|
          menu.item I18n.t('menu.members', scope: 'decidim'),
                    decidim_members.members_path,
                    position: 2.5,
                    active: :inclusive,
                    if: current_user.present? && current_organization.enable_module_members?
        end
      end
    end
  end
end
