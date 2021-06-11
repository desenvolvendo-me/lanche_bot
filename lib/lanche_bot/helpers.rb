# frozen_string_literal: true

require "csv"

# class Helper
class Helpers
  def self.csv_parse(file)
    CSV.read(file, **options)
  end

  def self.csv_include(file, attributes)
    CSV.open(file, "a", **options) do |csv|
      csv << attributes
    end
  end

  def self.options
    { col_sep: ",", headers: true }
  end
end
