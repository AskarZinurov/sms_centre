require 'sms_centre'
require 'rspec'

def camelcase(str)
  str.gsub(/_/, ' ').downcase.gsub(/\b[a-z]/) { |a| a.upcase }.gsub(/\s/, '')
end
