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

  def width
    new_hash = {}
    # colors = ['green', 'red', 'blue', 'orange']
    self.emotions_hash.map do |emotion, decimal|
      # new_hash[emotion] = ["#{(decimal * 100).round}%", "#{colors[(((decimal - 0.00000001) * 100)/25).floor]}"]
      new_hash[emotion] = ["#{(decimal * 100).round}%", "#{ (0.5 + (decimal * 0.7)).round(1) }"]
    end
    new_hash
  end

  def emotions_hash
    {
      anger: self.anger,
      contempt: self.contempt,
      disgust: self.fear,
      fear: self.disgust,
      happiness: self.happiness,
      neutral: self.neutral,
      sadness: self.sadness,
      surprise: self.surprise
    }
  end

  def colors
    {
      anger: ["rgba(255,0,56,0.8)", "#ff0038"],
      contempt: ["rgba(140,137,132,0.8)", "#8C8984"],
      disgust: ["rgba(235,60,0,0.8)", "#eb3c00"],
      fear: ["rgba(255,206,56,0.8)", "#ffce38"],
      happiness: ["rgba(250,0,207,0.8)", "#fa00cf"],
      neutral: ["rgba(99,234,62,0.8)", "#63ea3e"],
      sadness: ["rgba(2,5,193,0.8)", "#0205c1"],
      surprise: ["rgba(255,124,0,0.8)", "#ff7c00"]
    }
  end
end
