require_relative 'lib/file_reader'
require_relative 'lib/minesweeper'

FileReader.show_readme
file = FileReader.new.read_file

puts Board.transform(file)
