require File.join(File.dirname(__FILE__), "lib/reader")

if ARGV[0].nil? || ARGV[1].nil?
  puts ""
  puts "Please execute: $ ruby runner.rb [destinations.xml] [taxonomies.xml]"
  puts ""
else
  reader = Reader.new(ARGV[0], ARGV[1])
  reader.process

  puts "Finished!"
end
