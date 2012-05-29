#!/usr/bin/env ruby
# encoding: UTF-8

# Name:
#    twitter_url_extractor.rb 
#
# Purpose:
#    This is a small tool for extracting HTTP URIs from a search of Twitter
#    hashtags. Given a hashtag, it returns a list of unique links found within
#    the 100 most-recent matching tweets (if any).
#
# Usage:
#     ruby twitter_url_extractor.rb <hashtag>
#
# Options:
#     none
#
# Exit Status Codes:
#     0  = Success
#     64 = Command line usage error
#
# Copyright:
#     Copyright 2012 Todd A. Jacobs
#     All Rights Reserved
#
# License:
#     Released under the GNU General Public License (GPL)
#     http://www.gnu.org/copyleft/gpl.html
#
#     This program is free software; you can redistribute it and/or modify it
#     under the terms of the GNU General Public License as published by the Free
#     Software Foundation; either version 3 of the License, or (at your option)
#     any later version.
#
#     This program is distributed in the hope that it will be useful, but
#     WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
#     or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#     for more details.

require 'bundler/setup'
require 'twitter'

RECORD_LIMIT = 100
URL_PATTERN  = %r{http://[\w/.%-]+}i

def usage
  warn "Usage: ruby #{File.basename $0} <hashtag>"
  exit 64
end

# Ensure that the hashtag has a hash symbol. This makes the leading '#'
# optional, which avoids the need to quote or escape it on the command line.
def format_hashtag(hashtag)
  (hashtag.scan(/^#/).empty?) ? "##{hashtag}" : hashtag
end

# Return a sorted list of unique URLs found in the list of tweets.
def uniq_urls(tweets)
  tweets.map(&:text).to_s.scan(URL_PATTERN).flatten.compact.uniq
end

def search(hashtag)
  Twitter.search(hashtag, rpp: RECORD_LIMIT, result_type: 'recent')
end

if __FILE__ == $0
  usage unless ARGV.size >= 1
  hashtag = format_hashtag(ARGV[0])
  tweets = search(hashtag)
  puts uniq_urls(tweets)
end
