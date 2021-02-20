class FileReader
  CURRENT_PATH = File.dirname(__FILE__)
  README_FILE = 'README.md'.freeze

  def self.show_readme
    if use_flag?
      string = File.open(CURRENT_PATH[0..-4] + README_FILE) { |file| file.read }
      puts string
      exit
    end
  end

  def self.use_flag?
    ARGV[0] == '-h'
  end

  def read_file
    file_path = ARGV[0].nil? ? read_file_path : ARGV[0]
    file = File.open(file_path) { |file| file.read }
    file.split("\n")
  end

  def read_file_path
    print 'Enter input file path: '
    STDIN.gets.chomp
  end
end
