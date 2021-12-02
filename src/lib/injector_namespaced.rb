# frozen_string_literal: true

module Lib
  class InjectorNamespaced
    # @param [Dry::AutoInject::Builder] builder
    # @param [String] default_namespace
    def initialize(builder, default_namespace)
      @builder = builder
      @default_namespace = default_namespace
    end

    def [](*dependency_names)
      dependency_names
        .map { |dependency| handle_dependency(dependency) }
        .then { |names| @builder[*names] }
    end

    # rubocop:disable Style/OptionalBooleanParameter
    def respond_to?(name, include_private = false)
      @builder.respond_to?(name, include_private)
    end
    # rubocop:enable Style/OptionalBooleanParameter

    private

    def handle_dependency(dependency)
      case dependency
      when String
        @default_namespace + dependency
      when Hash
        dependency.transform_values { |name| @default_namespace + name }
      else
        raise :invalid_type
      end
    end
  end
end
