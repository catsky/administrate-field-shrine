require "administrate/field/base"
require "rails"

module Administrate
  module Field
    class Shrine < Administrate::Field::Base
      class Engine < ::Rails::Engine
      end

      # we should first try the regular data.url because if the versions are generated
      # in the background by a worker they won't be available immediately after
      # submitting the form
      # however, once data[:version].url is available data.url won't work,
      # so we're covered in both cases
      def url
        (regular_url || version_url).to_s
      end

      def regular_url
        data.try(:url)
      end

      def version_url
        data.try(:[], version).try(:url)
      end

      def url_only?
        options.fetch(:url_only, false)
      end

      def version
        options.fetch(:version, nil)
      end

      def cached_value
        resource.send("cached_#{attribute}_data")
      end

      def size
        options.fetch(:size, nil)
      end
    end
  end
end
