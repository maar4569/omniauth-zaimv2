require 'omniauth-oauth'
require 'multi_json'
module OmniAuth
  module Strategies
    class ZaimV2 < OmniAuth::Strategies::OAuth
      option :name, 'ZaimV2'
      option :client_options, {
        :site => 'https://api.zaim.net',
        :authorize_url => 'https://www.zaim.net/users/auth',
        :request_token_path => '/v2/auth/request',
        :access_token_path => '/v2/auth/access'
      }

      def request_phase
        super
      end
      
      uid { 
        raw_info['id']
      }
      
      info do
        {
          :login => raw_info['login'],
          :input_count => raw_info['input_count'].to_i,
          :day_count => raw_info['day_count'].to_i,
          :repeat_count => raw_info['repeat_count'].to_i,
          :id => raw_info['id'].to_i,
          :currency_code => raw_info['currency_code'],
          :week => raw_info['week'],
          :month => raw_info['month'],
          :day => raw_info['day'],
          :name => raw_info['name'],
          :profile_image_url => raw_info['profile_image_url'],
          :cover_image_url => raw_info['cover_image_url']
        }
      end

      extra do
        { :raw_info => raw_info  }
      end

      def raw_info
        #case verify
        @raw_info ||= MultiJson.load(access_token.get('https://api.zaim.net/v2/home/user/verify').body)["me"]
        rescue ::Errno::ETIMEDOUT
          raise ::Timeout::Error
        end
      end
    end
  end

OmniAuth.config.add_camelization 'zaimv2', 'ZaimV2'
