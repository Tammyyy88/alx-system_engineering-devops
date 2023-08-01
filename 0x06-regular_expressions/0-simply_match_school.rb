#!/usr/bin/env ruby

#require 'oniguruma'

def match_school(string)
  regexp = /School/
  matches = regexp.match(string)

  if matches
    return matches[0]
  else
    return nil
  end
end

if ARGV.empty?
  puts "Please provide a string to match."
else
  string = ARGV[0]
  result = match_school(string)

  puts result
end
