require 'spec_helper'
require 'omniauth-zaimv2'

describe OmniAuth::Strategies::ZaimV2 do

  subject do
    OmniAuth::Strategies::ZaimV2.new({})
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq("https://api.zaim.net")
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://www.zaim.net/users/auth')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('/v2/auth/request')
    end
  end
end
