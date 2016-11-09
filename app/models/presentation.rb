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

  def presentation_average_results
    avg = {}
    self.results.each do |r|
      r.emotions_hash.each do |k,v|
        avg[k] ? avg[k] = avg[k] + v.to_f.round(2) : avg[k] = v.to_f.round(2)
      end
    end

    avg.each {|k,v| avg[k] = avg[k]/results.length}
    avg
  end

  def format_pie_chart_data
    data = {
      labels: [
          "anger",
          "contempt",
          "fear",
          "disgust",
          "happiness",
          "neutral",
          "sadness",
          "surprise"
      ],
      datasets: [
          {
              data: [],
              backgroundColor: [
                "#ff0038",
                "#8C8984",
                "#eb3c00",
                "#ffce38",
                "#fa00cf",
                "#63ea3e",
                "#0205c1",
                "#ff7c00"
              ],
              hoverBackgroundColor: [
                "rgba(255,0,56,0.8)",
                "rgba(140,137,132,0.8)",
                "rgba(235,60,0,0.8)",
                "rgba(255,206,56,0.8)",
                "rgba(250,0,207,0.8)",
                "rgba(99,234,62,0.8)",
                "rgba(2,5,193,0.8)",
                "rgba(255,124,0,0.8)"
              ]
          }]
    }

    presentation_average_results.each {|k,v| data[:datasets][0][:data] << v}
    data
  end

  def average_all_presentations
    avg = {}
    presentations = Presentation.where(user_id: self.user_id)
    presentations.each do |p|
      p.presentation_average_results.each do |k,v|
        avg[k] ? avg[k] = avg[k] + v.to_f.round(2) : avg[k] = v.to_f.round(2)
      end
    end

    avg.each {|k,v| avg[k] = (avg[k]/presentations.length).round(2)}

    avg
  end

  def format_radar_data
    data = {
      labels: [
          "anger",
          "contempt",
          "fear",
          "disgust",
          "happiness",
          "neutral",
          "sadness",
          "surprise"
      ],
      datasets: [
          {
              label: self.name,
              backgroundColor: "rgba(179,181,198,0.2)",
              borderColor: "rgba(179,181,198,1)",
              pointBackgroundColor: "rgba(179,181,198,1)",
              pointBorderColor: "#fff",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(179,181,198,1)",
              data: []
          },
          {
              label: "All presentations",
              backgroundColor: "rgba(255,99,132,0.2)",
              borderColor: "rgba(255,99,132,1)",
              pointBackgroundColor: "rgba(255,99,132,1)",
              pointBorderColor: "#fff",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(255,99,132,1)",
              data: []
          }
      ]
    }

    average_all_presentations.each {|k,v| data[:datasets][0][:data] << v.round(2)}
    presentation_average_results.each {|k,v| data[:datasets][1][:data] << v.round(2)}
    data
  end

  def format_line_graph_data
    data = {
        # labels are emotions
        labels: [],
        datasets: [
          {
              label: "anger",
              borderWidth: 1,
              backgroundColor: "rgba(255,0,56,0.1)",
              borderColor: "#ff0038",
              fill: true,
              lineTension: 0.1,
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'miter',
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              spanGaps: true,
              # data are percentages
              data: []
          },
          {
              label: "contempt",
              backgroundColor: "rgba(140,137,132,0.1)",
              borderWidth: 1,
              borderColor: "#8C8984",
              fill: true,
              lineTension: 0.1,
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'miter',
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              spanGaps: true,
              data: []
          },
          {
              label: "disgust",
              backgroundColor: "rgba(235,60,0,0.1)",
              borderWidth: 1,
              borderColor: "#eb3c00",
              fill: true,
              lineTension: 0.1,
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'bevel',
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              spanGaps: true,
              data: []
          },
          {
              label: "fear",
              backgroundColor: "rgba(255,206,56,0.1)",
              borderWidth: 1,
              borderColor: "#ffce38",
              fill: true,
              lineTension: 0.1,
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'round',
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              spanGaps: true,
              data: []
          },
          {
              label: "happiness",
              backgroundColor: "rgba(250,0,207,0.1)",
              borderWidth: 1,
              borderColor: "#fa00cf",
              fill: true,
              lineTension: 0.1,
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'bevel',
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              spanGaps: true,
              data: []
          },
          {
              label: "neutral",
              backgroundColor: "rgba(99,234,62,0.1)",
              borderWidth: 1,
              borderColor: "#63ea3e",
              fill: true,
              lineTension: 0.1,
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'miter',
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              spanGaps: true,
              data: []
          },
          {
              label: "sadness",
              backgroundColor: "rgba(2,5,193,0.1)",
              borderWidth: 1,
              borderColor: "#0205c1",
              fill: true,
              lineTension: 0.1,
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'miter',
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              spanGaps: true,
              data: []
          },
          {
              label: "surprise",
              backgroundColor: "rgba(255,124,0,0.1)",
              borderWidth: 1,
              borderColor: "#ff7c00",
              fill: true,
              lineTension: 0.1,
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'miter',
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              spanGaps: true,
              data: []
          }
        ]
      }

      results = self.results
      results.each_with_index do |r, j|
        data[:labels] << "#{j * 1}s"
        r.emotions_hash.each_with_index {|k, i| data[:datasets][i][:data] << k[1].round(3)}
      end
      data
    end

  def date_given
    self.end_time.strftime("%D")
  end

  def start
    self.end_time.strftime("%H:%M %p")
  end

  def end
    self.end_time.strftime("%H:%M %p")
  end
end
