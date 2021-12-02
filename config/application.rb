# frozen_string_literal: true

require_relative 'boot'

require 'dry/system/container'
require 'dry/auto_inject'
require 'dry/monitor'

require 'pry'

Dry::Monitor.load_extensions(:rack)


module ParisRB
  class Application < Dry::System::Container
    use :env, inferrer: -> { ENV.fetch('APP_ENV', :development).to_sym }
    use :logging
    use :monitoring
    use :notifications
    use :bootsnap

    setting :logger, Dry::Monitor::Logger.new(root.join('log/development.log'))

    configure do |config|
      config.root = File.expand_path('..', __dir__)

      config.component_dirs.add 'src'

      after(:configure) do

        register(:rack_monitor, Dry::Monitor::Rack::Middleware.new(self[:notifications]))
        rack_logger = Dry::Monitor::Rack::Logger.new(self[:logger])
        rack_logger.attach(self[:rack_monitor])
      end
    end
  end

  Import = Dry::AutoInject(Application)
end
