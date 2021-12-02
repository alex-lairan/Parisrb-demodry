# frozen_string_literal: true

require_relative 'lib/injector_namespaced'

module Importers
  Application = Lib::InjectorNamespaced.new(ParisRB::Import, 'application.')
  Infrastructure = Lib::InjectorNamespaced.new(ParisRB::Import, 'infrastructure.')

  module Domain
  end
end
