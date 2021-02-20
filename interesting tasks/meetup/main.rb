require_relative 'lib/readme_viewer'
require_relative 'lib/meetup'

def read_args
  print 'Enter a year: '
  year = STDIN.gets.chomp
  print 'Enter a month: '
  month = STDIN.gets.chomp
  print 'Enter a weekday: '
  weekday = STDIN.gets.chomp
  print 'Enter a schedule: '
  schedule = STDIN.gets.chomp
  [year, month, weekday, schedule]
end

ReadmeViewer.show_readme

args = ARGV.length == 4 ? ARGV : read_args
puts "The date we need: #{Meetup.new(args[1].to_i, args[0].to_i).day(args[2].to_sym, args[3].to_sym)}."
