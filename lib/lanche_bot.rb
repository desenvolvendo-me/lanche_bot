# frozen_string_literal: true

Dir[File.join(File.dirname(__dir__), "lib/lanche_bot/**/*.rb")].sort.each { |f| require f }

module LancheBot
  class Error < StandardError; end
  # Your code goes here...
end
