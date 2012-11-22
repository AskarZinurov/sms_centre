Client gem for sms sending through http://smsc.ru

Tested with ruby-1.8.7-p370.

Configure

Create initializer like this config/sms_centre.rb:

```ruby
  SmsCentre.configure do |c|
    c.login    = 'sms centre username'
    c.password = 'password'
    #Use https protocol
    c.https    = true
  end
```

Available commands
 
  - Sending message:

    ```ruby
      SmsCentre::Http.deliver(['mobile1', 'mobile2'], body, :sender => 'sms sender')
    ```
    
    By default service ignoring sender string, but you can contact with support and switch this option on.
  
  - Get sms message status:
    
    ```ruby
      SmsCentre::Http.status(message_id, phone)
    ``` 

  - Get cost of message:
     
    ```ruby
      SmsCentre::Http.cost(phones, message)
    ```

  - Check account balance:
     
    ```ruby
      SmsCentre::Http.balance
    ```

