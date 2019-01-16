# frozen_string_literal: true

class AddCheckboxesToEnableModuleMembersAndPlaceholder < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_organizations, :enable_module_members, :boolean, default: false
    add_column :decidim_organizations, :enable_placeholder_members, :boolean, default: false
  end
end
