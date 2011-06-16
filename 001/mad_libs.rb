#!/usr/bin/env ruby

def usage()
  puts "mad_libs.rb <template.file>"
end

template = File.open(ARGV.shift || usage).read

while template =~ /\(\((.*?)\)\)/ do
  original = $1
  req, var = original.split(':').reverse

  print "Give me #{req}: "
  sub = ARGF.readline.strip

  template.gsub!("((#{original}))", "#{sub}")
  template.gsub!("((#{var}))", "#{sub}") if var
end

print "\n#{template}"

