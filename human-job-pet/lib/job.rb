# frozen_string_literal: true

class Job
  attr_reader :salary
  def initialize(salary: 100)
    @salary = salary
  end

  alias get_salary salary
end
