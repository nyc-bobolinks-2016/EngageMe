require 'net/http'

class GetEmotions
  def initialize
    @url = "https://dbc-engage-me.herokuapp.com/snapshot.jpg"
    # Test urls for testing on localhost without a camera

    urls = [
      'http://www.johnlund.com/Images/Throwing-Tomatoes-At-Speaker.jpg',
      'http://image.shutterstock.com/z/stock-photo-novi-sad-serbia-july-audience-infront-of-the-main-stage-at-the-best-european-music-festival-58065856.jpg',
      'http://wac.450f.edgecastcdn.net/80450F/1061evansville.com/files/2014/08/Movie_ScaredAudience_Fuse.jpg?w=600&h=0&zc=1&s=0&a=t&q=89',
      'http://www.promotehealthwellness.com/wp-content/uploads/2012/06/audience2.jpg'
    ]
    @url = urls.shuffle.first
  end

  def call
    uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')
    uri.query = URI.encode_www_form({
      })
    request = Net::HTTP::Post.new(uri.request_uri)
    request['Content-Type'] = 'application/json'
    request['Ocp-Apim-Subscription-Key'] = '1880289327bf4c33be53c47a8e67bd53'
    # Rails.application.secrets.ms_subscription_key
    request.body = { "url": @url }.to_json

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
    response.body
  end
end
