# frozen_string_literal: true

require 'csv'
require_relative '../data/const.rb'

class CSVWriter
  attr_reader :file_path, :columns

  def initialize(file_path:, columns_names:)
    @file_path = file_path
    @columns = columns_names
    write_columns(columns)
  end

  def write_hash(hash)
    CSV.open(file_path, 'ab+') do |csv|
      hash.values.each do |value|
        tmp_arr = []
        value.values.each do |v|
          tmp_arr << v
        end
        csv << tmp_arr
      end
    end
    puts 'Data written successfully!'
  end

  private

  def write_columns(columns)
    CSV.open(file_path, 'w+') do |csv|
      csv << columns
    end
  end
end
