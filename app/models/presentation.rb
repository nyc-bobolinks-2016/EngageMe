class Presentation < ApplicationRecord

  belongs_to :user
  has_many :results

  validates :name, :location, :audience, :start_time, :end_time, :user_id, presence: true
  validate :validate_user_id
  # before_save :update_times


  def validate_user_id
    errors.add(:user_id, "does not exist") unless User.exists?(self.user_id)
  end

  def return_formatted_params(params)
    
  end

  # def update_times
  #   self.start_time =
  # end
end
