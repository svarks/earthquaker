class EarthquakeQuery
  def initialize(params)
    @params = params
  end

  def all
    query = Earthquake.all

    if @params[:on]
      date = parse_date(@params[:on])
      query = query.where("datetime = ?", date)
    end

    if @params[:since]
      date = parse_date(@params[:since])
      query = query.where("datetime > ?", date)
    end

    if @params[:over]
      query = query.where("magnitude > ?", @params[:over])
    end

    query
  end

  private

  def parse_date(date)
    if date.is_a?(String)
      if date =~ /^\d+$/
        Time.at(date.to_i)
      else
        Time.parse(date)
      end
    else
      date
    end
  end
end
