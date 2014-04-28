require 'faraday'

require 'marvelous/version'
require 'marvelous/configuration'
require 'marvelous/adapter'

module Marvelous
  class << self
    # Initialize Marvelous config and client
    def init
      yield(config)

      if config.valid?
        init_client
      end
    end

    # Helper for initializing Marvelous client
    def init_client
      @client = Faraday.new(:url => config.base_url) do |jarvis|
        # Use the custom Marvelous adapter
        jarvis.adapter Marvelous::Adapter
      end
    end

    # Create or initialize configuration
    def config
      @config ||= Configuration.new
    end

    def client
      if config.valid?
        @client ||= init_client
      else
        raise MarvelousError, 'Client cannot be initialized without a valid client'
      end
    end

    def request
    end
  end

  # Error class used to represent any top level Marvelous errors
  class MarvelousError < Exception
  end

  # Error class used to represent any configuration errors
  class ConfigurationError < Exception
  end
end
