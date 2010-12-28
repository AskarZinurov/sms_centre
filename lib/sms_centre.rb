require 'uri'
require 'httparty'
require 'sms_centre/api_error'
require 'sms_centre/configuration'
require 'sms_centre/http'
require 'sms_centre/smtp'

module SmsCentre
  extend Configuration
  
  def debug_message(obj, message)
    p "#{obj.is_a?(Class) ? obj.name : obj.class.name}> #{message}" 
  end
  module_function :debug_message
end
