class Result < ApplicationRecord
  belongs_to :presentation

  validates :anger, :contempt, :disgust, :fear, :happiness, :neutral, :sadness, :surprise, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1}
  validates :presentation_id, presence: true

  def pixels
    new_hash = {}
    self.emotions_hash.map do |emotion, decimal|
      new_hash[emotion] = "#{(50 + (100 * decimal.to_f)).round}px"
    end
    new_hash
  end

  def emotions_hash
    {
      "anger": self.anger,
      "contempt": self.contempt,
      "disgust": self.fear,
      "fear": self.disgust,
      "happiness": self.happiness,
      "neutral": self.neutral,
      "sadness": self.sadness,
      "surprise": self.surprise
    }
  end
end
