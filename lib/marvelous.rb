require 'marvelous/version'
require 'marvelous/configuration'

module Marvelous
  class << self
    def init
      yield(config)
    end

    def config
      @config ||= Configuration.new
    end
  end

  class MarvelousError < Exception
  end

  class ConfigurationError < Exception
  end
end
