require 'unirest'

class GetEmotions
  def initialize
    @url = "http://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Batsheva_theater_crowd_in_Tel_Aviv_by_David_Shankbone.jpg/600px-Batsheva_theater_crowd_in_Tel_Aviv_by_David_Shankbone.jpg"
  end

  def call
    response = Unirest.post "https://api.projectoxford.ai/emotion/v1.0/recognize",
                            headers:{ "Content-Type" => "application/json", "Ocp-Apim-Subscription-Key" => Rails.application.secrets.ms_subscription_key },
                            { "url": @url }
    # RestClient::Resource.new('https://api.projectoxford.ai/emotion/v1.0/recognize')
    # response = client.post { "url": 'https://dbc-engage-me.herokuapp.com/snapshot.jpg' }, :content_type => 'application/json', :'Ocp-Apim-Subscription-Key' => Rails.application.secrets.ms_subscription_key
    # RestClient.post('https://api.projectoxford.ai/emotion/v1.0/recognize', { :payload => { "url": @url } }, { :headers => { :Content_Type => application/json, :Ocp-Apim-Subscription-Key => Rails.application.secrets.ms_subscription_key } }
    # ::Request.execute(method: :post, url: 'https://api.projectoxford.ai/emotion/v1.0/recognize', payload: { "url": @url }, headers: { Content_Type: application/json, Ocp-Apim-Subscription-Key: Rails.application.secrets.ms_subscription_key })
    # post 'https://api.projectoxford.ai/emotion/v1.0/recognize', {content_type :json, accept: :json}, {
    #   "url": "https://dbc-engage-me.herokuapp.com/snapshot.jpg" }, headers={"Ocp-Apim-Subscription-Key" => Rails.application.secrets.ms_subscription_key, })
    # json = open("https://api.projectoxford.ai/emotion/v1.0/recognize?url=#{@url}",
    # "Ocp-Apim-Subscription-Key" => "Key").read
    # uri = "https://api.projectoxford.ai/emotion/v1.0/recognize?url=#{@url}"
    # Net::HTTP.start(host, 3000) do |http|
    #   request = Net::HTTP::Get.new uri
    #   response = http.request request
  end
end
