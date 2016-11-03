class Result < ApplicationRecord

  belongs_to :presentation 
  validates :anger, :contempt, :disgust, :fear, :happiness, :neutral, :sadness, :surprise, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1}
  validates :presentation_id, presence: true
end
