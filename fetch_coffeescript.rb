#!/usr/bin/env ruby
require 'open-uri'
require 'fileutils'

COFFEE_URL = 'https://coffeescript.org/browser-compiler-legacy/coffeescript.js'
JS_PATH = 'lib/coffee_script/coffee-script.js'
GEMSPEC_PATH = 'coffee-script-source.gemspec'
SRC_RB_PATH = 'lib/coffee_script/source.rb'

puts 'Fetching latest coffee-script.js...'
js = URI.open(COFFEE_URL).read
File.write(JS_PATH, js)
puts 'Updated coffee-script.js.'

# Extract version from js file (look for vX.Y.Z in the first 10 lines)
version = js[/CoffeeScript Compiler v([\d.]+)/, 1]
raise 'Version not found in JS file!' unless version
puts "Detected CoffeeScript version: #{version}"

# Update gemspec version
gemspec = File.read(GEMSPEC_PATH)
gemspec.sub!(/spec.version = \"[\d.]+\"/, "spec.version = \"#{version}\"")
File.write(GEMSPEC_PATH, gemspec)
puts 'Updated gemspec version.'

# Update source.rb version
src_rb = File.read(SRC_RB_PATH)
src_rb.sub!(/VERSION = \"[\d.]+\"/, "VERSION = \"#{version}\"")
File.write(SRC_RB_PATH, src_rb)
puts 'Updated source.rb version.'

puts 'Done.'
