class Queens
  attr_accessor :positions
  attr_reader :dy, :dx

  def initialize(positions)
    check_positions(positions)
    @positions = positions
    @dy = (highest_coordinates[1] - lowest_coordinates[1])
    @dx = (highest_coordinates[0] - lowest_coordinates[0])
  end

  def check_positions(positions)
    raise ArgumentError, 'Invalid data!' if positions.find { |_color, position| !valid_position?(position) }
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  def same_row?
    positions[:white][0] == @positions[:black][0]
  end

  def same_column?
    positions[:white][1] == @positions[:black][1]
  end

  def same_diagonal?
    dx.abs == dy.abs
  end

  def highest_coordinates
    return positions[:black] if positions[:white][0] > positions[:black][0]
    return positions[:black] if positions[:white][1] > positions[:black][1]

    positions[:white]
  end

  def lowest_coordinates
    highest_coordinates == positions[:white] ? positions[:black] : positions[:white]
  end

  def valid_position?(position)
    position.size == 2 && position.all? { |number| number.between?(0, 7) }
  end
end
