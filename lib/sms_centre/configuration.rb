require 'digest/md5' 

module SmsCentre
  module Configuration
    VALID_OPTIONS_KEYS = [:login, :password, :https, :debug, :api_server]

    DEFAULT_LOGIN    = nil
    DEFAULT_PASSWORD = nil
    DEFAULT_HTTPS    = false
    DEFAULT_DEBUG    = true
    DEFAULT_API_SERVER = 'smsc.ru/sys'

    attr_accessor *VALID_OPTIONS_KEYS
    
    def self.extended(base)
      base.reset
    end
    
    def configure
      yield self
    end
    
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end
    
    def hashed_password
      Digest::MD5.hexdigest(password)
    end

    def reset
      VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", SmsCentre::Configuration.const_get("default_#{key}".upcase))
      end
    end
  end
end
