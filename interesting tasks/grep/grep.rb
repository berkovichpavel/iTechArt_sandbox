class Grep
  attr_reader :flags, :files, :pattern

  def initialize(pattern, flags, files)
    @pattern = pattern
    @flags = flags
    @files = files
  end

  def self.grep(pattern, flags, files)
    new(pattern, flags, files).grep
  end

  def grep
    answer = []
    files.each do |file|
      File.readlines(file).each_with_index do |line, index|
        next unless match?(line)

        result = line.chop
        result = "#{index.next}:" + result if line_numbers?
        result = "#{file}:" + result if several_files?
        result = file if only_file_names?
        answer << result
      end
    end
    answer.uniq.join("\n")
  end

  private

  def check_pattern
    full_line_match? ? "^#{pattern}$" : pattern
  end

  def expression
    register_insensitive? ? /#{check_pattern}/i : /#{check_pattern}/
  end

  def match?(line)
    inverted_match? ? line !~ expression : line =~ expression
  end

  def register_insensitive?
    flags.include?('-i')
  end

  def full_line_match?
    flags.include?('-x')
  end

  def inverted_match?
    flags.include?('-v')
  end

  def line_numbers?
    flags.include?('-n')
  end

  def only_file_names?
    flags.include?('-l')
  end

  def several_files?
    files.size > 1
  end
end
