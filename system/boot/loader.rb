# frozen_string_literal: true

ParisRB::Application.boot(:loader) do |app|
  init do
    require 'zeitwerk'
  end

  start do
    loader = Zeitwerk::Loader.new
    loader.push_dir(app.root.join('src'))
    loader.setup
  end
end
