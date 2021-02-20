require_relative 'lib/readme_viewer'
require_relative 'lib/acronym'

def read_line
  print 'Enter setting to create abbreviation: '
  STDIN.gets.chomp
end

ReadmeViewer.show_readme
str = ARGV[0].nil? ? read_line : ARGV[0]
puts "Abbreviation: #{Acronym.abbreviate(str.to_s)}."
