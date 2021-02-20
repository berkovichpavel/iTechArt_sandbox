# frozen_string_literal: true

require 'capybara'
require 'selenium-webdriver'

class PageParser
  attr_reader :driver, :browser, :url

  def initialize(url:)
    initial_setup
    @browser = Capybara.current_session
    @driver = browser.driver.browser
    @url = url
  end

  def find_elements_href(regular: /.*/)
    browser.visit(url)
    elements = browser.all('a')
    href_links = []
    elements.each do |element|
      href_links << element['href'] if element['href'] =~ regular
    end
    href_links = href_links.uniq
    href_links.each_with_index { |el, i| puts "#{i + 1}. #{el}" }
    href_links
  end

  def get_page(page_url)
    driver.get(page_url)
  end

  def get_title(html_element:, element_name:)
    driver.find_element(html_element.to_sym, element_name).text
  rescue StandardError
    'default title'
  end

  def get_img_href(html_element:, element_name:)
    driver.find_element(html_element.to_sym, element_name)['style'] =~ /(?<=\().+?(?=\))/
    Regexp.last_match[0].gsub('"', '')
  rescue StandardError
    'default href'
  end

  def get_text(html_element:, element_name:, another_element_name: 'news-text')
    begin
      text = driver.find_element(html_element.to_sym, element_name)
    rescue Selenium::WebDriver::Error::NoSuchElementError
      text = driver.find_element(html_element.to_sym, another_element_name)
    end
    text = text.text.slice(0..199)
    text.slice(0..text.rindex('.'))
  rescue StandardError
    'default text'
  end

  private

  def initial_setup
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end

    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 10
      config.default_driver = :selenium
    end
  end
end
