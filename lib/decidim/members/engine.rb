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

      routes do
        resources(:members, only: [:index], path: 'members')
      end

      initializer 'decidim.stats' do
        Decidim.stats.register :members_count, priority: StatsRegistry::HIGH_PRIORITY do |organization, _start_at, _end_at|
          user_ids = Decidim::Verifications::Authorizations.new(organization: organization, granted: true).pluck(:decidim_user_id).uniq
          Decidim::Members::User.where(id: user_ids).public_spaces.count
        end
      end

      initializer 'decidim_members.inject_abilities_to_user' do |_app|
        Decidim.configure do |config|
          config.abilities += [
            'Decidim::Members::Abilities::UserAbility'
          ]
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
