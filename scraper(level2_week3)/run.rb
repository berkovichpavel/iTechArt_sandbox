# frozen_string_literal: true

require_relative 'data/const'
require_relative 'lib/page_parser'
require_relative 'lib/csv_writer'

def print_site(link, title, img, text)
  p "------ #{link} ------"
  p "title: #{title}"
  puts "img: #{img}"
  p "text: #{text}"
  puts "------------------------------------------------\n\n\n"
end

puts 'Wait a bit please...'

site_parser = PageParser.new(url: URL)
pages_links = site_parser.find_elements_href(
  regular: REGULAR_FOR_LINKS
)
csv = CSVWriter.new(file_path: CSV_FILE_PATH, columns_names: COLUMNS)
information_onliner = {}

pages_links.each do |link|
  site_parser.get_page(link)
  title = site_parser.get_title(html_element: :class, element_name: TITLE)
  img = site_parser.get_img_href(html_element: :class, element_name: IMAGE)
  text = site_parser.get_text(
    html_element: :class,
    element_name: TEXT1,
    another_element_name: TEXT2
  )
  information_onliner[link] = { title: title, img_href: img, text: text }
  print_site(link, title, img, text)
end

csv.write_hash(information_onliner)
