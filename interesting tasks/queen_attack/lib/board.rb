require_relative 'queen_attack'

class Board
  attr_accessor :board, :queens

  def initialize(positions)
    @board = []
    @queens = Queens.new(positions)
    board_init
  end

  def show
    8.times do |i|
      8.times { |j| print board[i][j] }
      puts
    end
  end

  def create_path
    if queens.attack?
      dx = queens.dx
      dy = queens.dy
      end_pos = queens.highest_coordinates
      dx = (dx.abs - 1) * sgn(dx) unless dx.zero?
      dy = (dy.abs - 1) * sgn(dy) unless dy.zero?
      until dx.zero? && dy.zero?
        start_pos = [end_pos[0] - dx, end_pos[1] - dy]
        board[start_pos[0]][start_pos[1]] = ' * '
        dx = (dx.abs - 1) * sgn(dx) unless dx.zero?
        dy = (dy.abs - 1) * sgn(dy) unless dy.zero?
      end
    else
      puts 'Impossible to attack!'
    end
  end

  private

  def board_init
    8.times do
      str = []
      8.times { str << ' - ' }
      board << str
    end
    add_figure(queens.positions[:black], '♛')
    add_figure(queens.positions[:white], '♕')
  end

  def add_figure(position, figure)
    board[position[0]][position[1]] = " #{figure} "
  end

  def sgn(int)
    (int <=> 0).negative? ? -1 : 1
  end
end
