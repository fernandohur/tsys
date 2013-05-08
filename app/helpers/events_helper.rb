module EventsHelper

  def pretty_date(date)
    date = date.to_time
    date.strftime("%B %d at %l:%M:%S")
  end

end
