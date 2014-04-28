require 'digest/md5'

module Marvelous
  class Configuration
    attr_accessor :public_key, :private_key

    # Checks if public and private keys have been set
    def valid?
      if public_key && private_key
        true
      else
        false
      end
    end

    # Unique, always incrementing nonce used for md5 hash
    def timestamp
      Time.now.to_i
    end

    # MD5 hashed digest defined by Marvel docs:
    #   https://developer.marvel.com/documentation/authorization
    def digest
      if valid?
        Digest::MD5.hexdigest("#{timestamp}#{private_key}#{public_key}")
      else
        raise ConfigurationError, 'Configuration not valid.'
      end
    end

    # Base url endpoint to make requests to for the Marvel API
    BASE_URL = 'http://gateway.marvel.com/v1/public'
    def base_url
      BASE_URL
    end

    # Base params required to authenticate requests to the the Marvel API
    def base_params
      "api_key=#{public_key}&ts=#{timestamp}&hash=#{digest}"
    end
  end
end