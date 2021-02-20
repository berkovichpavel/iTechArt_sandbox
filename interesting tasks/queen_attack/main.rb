require_relative 'lib/readme_viewer'
require_relative 'lib/queen_attack'
require_relative 'lib/board'

ReadmeViewer.show_readme
first_coord = []
2.times { |i| first_coord << ARGV[i].to_i }
second_coord = []
2.times { |i| second_coord << ARGV[i + 2].to_i}

board = Board.new(white: first_coord, black: second_coord)
board.create_path
board.show
