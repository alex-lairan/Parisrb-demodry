# frozen_string_literal: true

require 'hanami/middleware/body_parser'
require 'rack/cors'

module Application
  module Web
    # rubocop:disable Metrics/MethodLength
    def self.builder
      Rack::Builder.new do
        use Rack::Cors do
          allow do
            origins '*'
            resource '*',
                     methods: %i[get post delete put patch options head],
                     headers: :any,
                     max_age: 600
          end
        end

        use Hanami::Middleware::BodyParser, :json
        use ParisRB::Application[:rack_monitor]
        run Router
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
