class ReadmeViewer
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
end
