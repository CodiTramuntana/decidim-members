# frozen_string_literal: true

Decidim.register_participatory_space(:members) do |participatory_space|
  participatory_space.model_class_name = 'Decidim::Member'

  participatory_space.participatory_spaces do |organization|
    Decidim::Members::OrganizationMembers.new(organization).query
  end

  participatory_space.permissions_class_name = 'Decidim::Members::Permissions'

  participatory_space.context(:public) do |ctx|
    ctx.engine = Decidim::Members::Engine
  end
  participatory_space.context(:admin) do |ctx|
    ctx.engine = Decidim::Members::AdminEngine
  end
end
