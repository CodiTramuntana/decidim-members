# frozen_string_literal: true

require "rails"
require "active_support/all"

require "decidim/core"
require "sanitize"

module Decidim
  module Members
    # Decidim's Members Rails Engine.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Members

      routes do
      end

    end
  end
end
