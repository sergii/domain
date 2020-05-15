#!/usr/bin/env ruby

require 'whois'
require 'whois-parser'
require 'pry-byebug'
require 'colorize'
require 'time_difference'

domain = ARGV[0]
record = Whois.whois(domain)
parser = record.parser

created_on = parser.created_on if parser.registered?
lookup_result = parser.available? ? "available!" : "occupied"
time_diff = TimeDifference.between(created_on, Time.now).humanize if created_on

yehooo = "\u{1f600}"
shit = "\u{1f4a9}"

puts "Domain '#{domain}' is #{lookup_result} #{time_diff}"

# Add support fot multiple arguments
# ARGV.each do|argument|
#   puts "Argument: #{argument}"
# end

## Notices

# Try to use OptionParser
# https://ruby-doc.org/stdlib-2.7.1/libdoc/optparse/rdoc/OptionParser.html

# Try to use cliqr
#https://github.com/anshulverma/cliqr
