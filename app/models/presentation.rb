class Presentation < ApplicationRecord

  belongs_to :user
  has_many :results, dependent: :destroy

  validates :name, :location, :audience, :start_time, :end_time, :user_id, presence: true
  validate :validate_user_id
  # before_save :update_times


  def validate_user_id
    errors.add(:user_id, "does not exist") unless User.exists?(self.user_id)
  end

  def time_pretty
    time = self.time_taken.to_i
    seconds = time - (time/60)*60
    minutes = (time - seconds)/60
    hours = (time - minutes * 60 - seconds)/60
    hours = "0#{hours}" if hours.to_s.length < 2
    minutes = "0#{minutes}" if minutes.to_s.length < 2
    seconds = "0#{seconds}" if seconds.to_s.length < 2

    "#{hours}:#{minutes}:#{seconds}"
  end

end
