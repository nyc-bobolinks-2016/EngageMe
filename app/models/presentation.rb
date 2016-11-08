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
    hours = time/(3600)
    minutes = (time - hours * 3600)/60
    seconds = time - hours*3600 - minutes * 60
    hours = "0#{hours}" if hours.to_s.length < 2
    minutes = "0#{minutes}" if minutes.to_s.length < 2
    seconds = "0#{seconds}" if seconds.to_s.length < 2

    "#{hours}:#{minutes}:#{seconds}"
  end

  def format_line_graph_data
    data = {
        # labels are emotions
        labels: [],
        datasets: [
          {
              label: "anger",
              backgroundColor: "rgba(220,220,220,0.2)",
              borderColor: "red",
              # data are percentages
              data: []
          },
          {
              label: "contempt",
              backgroundColor: "rgba(151,187,205,0.2)",
              borderColor: "purple",
              data: []
          },
          {
              label: "disgust",
              backgroundColor: "rgba(151,187,205,0.2)",
              borderColor: "brown",
              data: []
          },
          {
              label: "fear",
              backgroundColor: "rgba(151,187,205,0.2)",
              borderColor: "darkblue",
              data: []
          },
          {
              label: "happiness",
              backgroundColor: "rgba(151,187,205,0.2)",
              borderColor: "yellow",
              data: []
          },
          {
              label: "neutral",
              backgroundColor: "rgba(151,187,205,0.2)",
              borderColor: "green",
              data: []
          },
          {
              label: "sadness",
              backgroundColor: "rgba(151,187,205,0.2)",
              borderColor: "lightblue",
              data: []
          },
          {
              label: "surprise",
              backgroundColor: "rgba(151,187,205,0.2)",
              borderColor: "orange",
              data: []
          }
        ]
      }

      results = self.results
      results.each_with_index do |r, j|
        data[:labels] << "#{j * 3}s"
        r.emotions_hash.each_with_index {|k, i| data[:datasets][i][:data] << k[1].round(3)}
      end

      data
  end
end
