require 'net/http'

class GetEmotions
  def initialize
    # @url = "https://dbc-engage-me.herokuapp.com/snapshot.jpg"
    @url = 'http://blog.getcatchbox.com/wp-content/uploads/2015/04/blogphotoone-35.jpg'
  end

  def call
    uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')
    uri.query = URI.encode_www_form({
      })
    request = Net::HTTP::Post.new(uri.request_uri)
    request['Content-Type'] = 'application/json'
    request['Ocp-Apim-Subscription-Key'] = '1880289327bf4c33be53c47a8e67bd53'
    request.body = { "url": @url }.to_json

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
    response.body
  end
end
