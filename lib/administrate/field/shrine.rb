require "administrate/field/base"
require "rails"
require 'byebug'

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
    end
  end
end
