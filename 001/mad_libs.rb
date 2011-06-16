#!/usr/bin/env ruby

def usage()
  puts "mad_libs.rb <template.file>"
end

template = File.open(ARGV.shift || usage).read

while template =~ /\(\((.*?)\)\)/ do
  original = $1
  tmp = original.split(':')
  var = nil
  req = tmp[0]

  if tmp.length > 1
    var = tmp[0]
    req = tmp[1]
  end

  print "#{req}: "
  sub = ARGF.readline.strip

  template.gsub!("((#{original}))", "#{sub}")
  template.gsub!("((#{var}))", "#{sub}") if var
end

print "\n#{template}"

