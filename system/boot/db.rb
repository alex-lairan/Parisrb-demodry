# frozen_string_literal: true

ParisRB::Application.boot(:db) do
  init do
    require 'rom'
    require 'rom-sql'
    require 'rom/sql/extensions/postgres'
  end

  start do
    connection = Sequel.connect(ENV['DATABASE_URL'], extensions: %i[pg_timestamptz])

    rom = ROM::Configuration.new(:sql, connection) do |config|
      config.gateways[:default].use_logger(ParisRB::Application.logger)
    end

    register('db.connection', connection)
    register('db.config', rom)
  end
end
