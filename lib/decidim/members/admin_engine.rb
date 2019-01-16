# frozen_string_literal: true

require 'rails'
require 'decidim/core'

module Decidim
  module Members
    # Decidim's Members Rails Admin Engine.
    # There is nothing to administer, it's 'only provided since Decidim
    # requires it.
    class AdminEngine < ::Rails::Engine
    end
  end
end
