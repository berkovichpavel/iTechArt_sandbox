class Acronym
  def self.abbreviate(str)
    str.split('-').join(' ').split.map(&:chr).join.upcase
  end
end
