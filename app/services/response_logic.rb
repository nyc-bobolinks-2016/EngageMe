class ResponseLogic
  attr_reader :avrg

  def initialize
    @avrg = {
      'anger' => 0,
      'contempt' => 0,
      'disgust' => 0,
      'fear' => 0,
      'happiness' => 0,
      'neutral' => 0,
      'sadness' => 0,
      'surprise' => 0
    }
  end

  def average(response)
    response.map do |hash|
      hash.map do |key, val|
        if key == "scores"
          val.keys.each_with_index do |k, i|
            @avrg[k] = (@avrg[k] + val[k]).to_f/(i/8 + 1)
          end
        end
      end
    end
    @avrg.map {|k,v| @avrg[k] = v/response.length}
    @avrg
  end
end
