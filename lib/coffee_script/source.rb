module CoffeeScript
  module Source
    VERSION = "1.16.0"
    def self.bundled_path
      File.expand_path("../coffee-script.js", __FILE__)
    end
  end
end
