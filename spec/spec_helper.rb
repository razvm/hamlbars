require 'rubygems'
require 'bundler'
require 'tempfile'
Bundler.setup
Bundler.require

# Small patch because Tilt expects files to respond to #to_str
class Tempfile
  def to_str
    path
  end
end

require File.expand_path(__FILE__, '../lib/hamlbars.rb')

RSpec.configure do |config|
  config.color = true
  config.formatter = 'd'
  filtered_specs = []
  if Haml::VERSION <= '4.0.7'
    filtered_specs << :haml5
  else
    filtered_specs << :haml4
  end
  if Sprockets::VERSION <= '2.12.4'
    filtered_specs << :sprockets3
  else
    filtered_specs << :sprockets2
  end
  config.filter_run_excluding :type => lambda {|v| filtered_specs.include?(v)}
end
