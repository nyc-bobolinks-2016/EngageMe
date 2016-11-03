class Presentation < ApplicationRecord

  belongs_to :user
  has_many :results

  validates :name, :location, :audience, :start_time, :end_time, :user_id, presence: true
  validate :validate_user_id


  def validate_user_id
    errors.add(:user_id, "does not exist") unless User.exists?(self.user_id)
  end

  def duration
    self.end_time - self.start_time
  end
end
