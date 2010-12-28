require 'helper'

describe SmsCentre do
  before(:all) do
    SmsCentre.configure do |c|
      c.login = 'test'
      c.password = 'test'
      c.https = true
    end
  end

  context 'recieving errors' do
    before(:each) do
      @mobile_phones = ['89033144265']
      @message = 'text text text'
    end

    it 'should return error properly' do
      Dir["spec/fixtures/**/*.html"].each do |f|
        SmsCentre::Http.stub!(:api_request).and_return(IO.read(f))
        begin
          SmsCentre::Http.deliver(@mobile_phones, @message)
        rescue SmsCentre::ApiError => e
          e.is_a?(SmsCentre.const_get camelcase(f.match(/fixtures\/(\w+)\.html$/)[1])).should be_true
        end
      end 
    end 
  end
end
