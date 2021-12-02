# frozen_string_literal: true

require_relative 'config/application'

ParisRB::Application.finalize!

run Application::Web.builder
