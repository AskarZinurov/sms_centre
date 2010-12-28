module SmsCentre
  class ApiError < Exception
  end
end

Dir[File.dirname(__FILE__) + "/errors/**/*.rb"].each {|f| require f}

module SmsCentre
  ERROR_CODES = { 
    1  => ParamError, 
    2  => AuthError, 
    3  => BalanceError, 
    4  => BlackListError, 
    5  => DateFormatError, 
    6  => MessageRestrictedError, 
    7  => PhoneNumberFormatError, 
    8  => DeliveryError, 
    9  => FrequencyError, 
    10 => MessageLimitError }
  
  class ApiError 
    class << self 
      def check_error(message)
        if message.match(/^ERROR = (\d+)(.*?)/)
          error_code = Integer(message.match(/^ERROR = (\d+)(.*?)/)[1])
          raise ERROR_CODES[error_code].new(message)
        end
      end
    end
  end
end

