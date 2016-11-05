require 'rest-client'

class GetEmotions
  def initialize
    @url = "https://dbc-engage-me.herokuapp.com/snapshot.jpg"
  end

  def call
    RestClient.post("https://api.projectoxford.ai/emotion/v1.0/recognize", {
      "url": "https://dbc-engage-me.herokuapp.com/snapshot.jpg" }, headers={"Ocp-Apim-Subscription-Key" => Rails.application.secrets.ms_subscription_key})
    # json = open("https://api.projectoxford.ai/emotion/v1.0/recognize?url=#{@url}",
    # "Ocp-Apim-Subscription-Key" => "Key").read
    # uri = "https://api.projectoxford.ai/emotion/v1.0/recognize?url=#{@url}"
    # Net::HTTP.start(host, 3000) do |http|
    #   request = Net::HTTP::Get.new uri
    #   response = http.request request
  end
end
