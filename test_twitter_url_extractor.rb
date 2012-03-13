#!/usr/bin/env ruby

require_relative 'twitter_url_extractor'
require 'minitest/autorun'

describe '#format_hashtag' do
  it 'should prepend a # to strings when needed' do
     format_hashtag('foo').must_equal '#foo' 
  end
end

describe '#uniq_urls' do
  let(:tweet) { YAML.load "--- !ruby/object:Twitter::Status\nattrs:\n  created_at: Mon, 12 Mar 2012 13:17:12 +0000\n  from_user: rubygems\n  from_user_id: 14881835\n  from_user_id_str: '14881835'\n  from_user_name: RubyGems\n  geo: \n  id: 179194330383257600\n  id_str: '179194330383257600'\n  iso_language_code: en\n  metadata:\n    result_type: recent\n  profile_image_url: http://a0.twimg.com/profile_images/651086638/rubygems-125x125t_normal.png\n  profile_image_url_https: https://si0.twimg.com/profile_images/651086638/rubygems-125x125t_normal.png\n  source: ! '&lt;a href=&quot;http://rubygems.org&quot; rel=&quot;nofollow&quot;&gt;RubyGems.org&lt;/a&gt;'\n  text: ! 'rspec-core (2.9.0.rc2): http://t.co/t5e25osr BDD for Ruby. RSpec runner\n    and example groups.'\n  to_user: \n  to_user_id: \n  to_user_id_str: \n  to_user_name: \n" }
  
  it 'should find urls' do
    uniq_urls( [tweet] ).must_equal ['http://t.co/t5e25osr']
  end

  it 'should reject duplicate urls' do
    duplicate_tweets = [tweet, tweet]
    uniq_urls(duplicate_tweets).size.must_equal 1
  end

  it 'should not raise errors when no tweets with URLs are found' do
    uniq_urls( [] ).size.must_equal 0
  end
end
