require 'marvelous/version'
require 'marvelous/configuration'

module Marvelous
  class << self
    # Initialize Marvelous config
    def init
      yield(config)
      config
    end

    # Create or initialize configuration
    def config
      @config ||= Configuration.new
    end
  end

  # Error class used to represent any top level Marvelous errors
  class MarvelousError < Exception
  end

  # Error class used to represent any configuration errors
  class ConfigurationError < Exception
  end
end
