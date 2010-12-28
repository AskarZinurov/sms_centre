module SmsCentre
  class Http
    class << self
      def status(message_id, phone)
        command 'status', { :id => message_id, :phone => phone }
      end
      
      def cost(phones, message, options = {})
        response = command('send', deliver_settings(phones, message, options.merge(:cost => 1)))
        data = response.match(/^([\d\.]+) \((\d+) SMS\)/)
        { :sum => Float(data[1]), :message_count => Integer(data[2]) }
      end

      def deliver(phones, message, options = {})
        data = command('send', deliver_settings(phones, message, options)).match(/^OK - (\d+) SMS, ID - (\d+)/)
        { :message_count => Integer(data[1]), :id => Integer(data[2]) } 
      end
     
      def balance
        Float(command('balance'))
      end
      
      private
      
      def deliver_settings(phones, message, options = {})
        settings = { :translit => 0, 
                     :time => 0, 
                     :id => 0, 
                     :flash => 0, 
                     :sender => '', 
                     :charset => 'utf8', 
                     :timezone => '' }.merge(options)
        settings[:tz] = settings.delete(:timezone)
        settings[:phones] = phones.join(';')
        settings[:mes] = message
        settings
      end
      
      def api_request(url, args = {})
        api_params = args.merge(:login => SmsCentre::login, :psw => SmsCentre::hashed_password)
        HTTParty.post(url, :body => api_params).parsed_response
      end

      def command(cmd, args = {})
        uri = URI.parse("#{SmsCentre::https ? 'https' : 'http'}://#{SmsCentre::api_server}/#{cmd}.php")
        response = api_request(uri.to_s, args)
        SmsCentre::ApiError.check_error(response)
        SmsCentre::debug_message(self, response) if SmsCentre::debug
        response 
      end
    end
  end
end
