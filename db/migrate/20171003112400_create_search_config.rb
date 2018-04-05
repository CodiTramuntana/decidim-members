# frozen_string_literal: true

class CreateSearchConfig < ActiveRecord::Migration[5.1]
  def change
    enable_extension :unaccent
    enable_extension :pg_trgm
  end
end
