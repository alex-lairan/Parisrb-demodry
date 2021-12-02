# frozen_string_literal: true

ParisRB::Application.boot(:web) do |_app|
  init do
    require 'hanami/router'
    require 'hanami/controller'
  end
end
