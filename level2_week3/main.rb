# frozen_string_literal: true

# require 'selenium-webdriver'
# require 'nokogiri'
# require 'capybara'
# require_relative 'data/const'
# # Configurations
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end
# Capybara.javascript_driver = :chrome
# Capybara.configure do |config|
#   config.default_max_wait_time = 10 # seconds
#   config.default_driver = :selenium
# end
# # Visit
# browser = Capybara.current_session
# driver = browser.driver.browser
#
# browser.visit "https://angel.co/companies"




session = Capybara::Session.new(:selenium_chrome)
session.visit(URL)
arr = session.find_all('.b-tile-header')


p arr

session.save_page



# require 'capybara'
# require 'selenium-webdriver'
# require 'nokogiri'
#
# require_relative 'data/const.rb'
#
# # webdriver configuration for Gecko
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end
#
# Capybara.javascript_driver = :chrome
# Capybara.configure do |config|
#   config.default_max_wait_time = 10
#   config.default_driver = :selenium
# end
#
# puts 'Wait a bit please...'
# # session = Capybara::Session.new(:selenium_chrome)
#
# browser = Capybara.current_session
# driver = browser.driver.browser
# browser.visit URL




