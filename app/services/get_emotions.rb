require 'net/http'

class GetEmotions
  def initialize
    @url = "https://dbc-engage-me.herokuapp.com/snapshot.jpg"
  end

  def call
    uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')
    uri.query = URI.encode_www_form({
      })
    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = Rails.application.secrets.ms_subscription_key
    # Request body
    request.body = { "url": @url }.to_json

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
  end
end
