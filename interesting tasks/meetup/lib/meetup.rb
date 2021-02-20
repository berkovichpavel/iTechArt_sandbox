require 'date'

class Meetup
  OFFSETS = {
    first: 1,
    second: 8,
    third: 15,
    fourth: 22,
    fifth: 29,
    teenth: 13,
    last: -7
  }.freeze

  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    date = Date.new(year, month, OFFSETS[schedule])
    date = date.next until date.send("#{weekday}?".to_s)
    date
  end
end
