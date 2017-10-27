require "administrate/field/base"
require "rails"

module Administrate
  module Field
    class Shrine < Administrate::Field::Base
      class Engine < ::Rails::Engine
      end

      def url
        data.try(:url).to_s
      end

      def url_only?
        options.fetch(:url_only, false)
      end

      def cached_value
        resource.send("cached_#{attribute}_data")
      end
    end
  end
end
