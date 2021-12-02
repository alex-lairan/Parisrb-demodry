# frozen_string_literal: true

ParisRB::Application.boot(:persistence) do |app|
  start do
    config = app['db.config']
    config.auto_registration("#{app.root}/src/infrastructure")

    rom = ROM.container(app['db.config'])

    register('container', rom)
  end
end
