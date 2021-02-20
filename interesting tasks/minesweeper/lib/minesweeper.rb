class Board
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def mines_nearby(y, x)
    mines = 0
    (y - 1..y + 1).each do |i|
      (x - 1..x + 1).each do |j|
        mines += 1 if input[i][j] == '*'
      end
    end
    mines.zero? ? ' ' : mines
  end

  def instance_transform
    row_length = input[0].length
    input.each { |row| raise ArgumentError if (row =~ /^[\+,\|][-\s\*]+[\+,\|]$/).nil? || row.length > row_length }
    input.each_with_index.map do |row, y_index|
      row.split('').each_with_index.map { |item, x_index| item == ' ' ? mines_nearby(y_index, x_index) : item }.join('')
    end
  end

  def self.transform(input)
    new(input).instance_transform
  end
end
