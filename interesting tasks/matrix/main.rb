require_relative 'lib/readme_viewer'
require_relative 'lib/matrix'

def read_str
  puts 'Enter matrix by pattern "1 2 , 3 4"'
  STDIN.gets.chomp.to_s
end

ReadmeViewer.show_readme

str = ARGV[0].nil? ? read_str : ARGV[0]
matrix = Matrix.new(str)
puts "Matrix rows: #{matrix.rows}"
puts "Matrix columns: #{matrix.columns}"
