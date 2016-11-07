class ParseNewPresentation

  attr_reader :name, :location, :audience, :date, :starting_time, :ending_time, :start_period, :end_period, :notes

  def initialize(args={})
    @name = args.fetch("name")
    @location = args.fetch("location")
    @audience = args.fetch("audience")
    @date = args.fetch("date")
    @starting_time = args.fetch("starting_time","")
    @start_period = args.fetch("start_period")
    @ending_time = args.fetch("ending_time","")
    @end_period = args.fetch("end_period")
    @notes = args.fetch("notes")

  end

  def return_formatted_params

    {
      name: name,
      location: location,
      audience: audience,
      start_time: DateTime.parse("#{date} #{starting_time} #{start_period}"),
      end_time: DateTime.parse("#{date} #{ending_time} #{end_period}"),
      notes: notes
    }
  end
end
