class Matrix
  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = matrix.split(',').map { |row| row.split(' ').map(&:to_i) }
    @columns = rows.transpose
  end
end
