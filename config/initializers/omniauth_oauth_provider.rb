module OmniAuth
  module Strategies
    class Oauth < OmniAuth::Strategies::OAuth2

      option :name, "oauth"

      def client
        options.client_options[:site] = options[:site] || "http://oauth.provider.com"
        super
      end

      uid { raw_info['id'] }

      info do
        {
          :name  => raw_info['name'],
          :email => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/oauth/users/info').parsed
      end

    end
  end
end
