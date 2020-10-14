# frozen_string_literal: true

# This class is for optimizing time periods
class TimeManager
  attr_accessor :intervals

  def initialize(intervals)
    @intervals = intervals.sort.uniq
  end

  def optimize_interval
    i = 0
    until intervals[i + 1].nil?
      if intervals[i].last >= intervals[i + 1].first
        intervals[i][1] = intervals[i + 1].last if intervals[i].last <= intervals[i + 1].last
        intervals.delete(intervals[i + 1])
      else
        i += 1
      end
    end
  end
end
