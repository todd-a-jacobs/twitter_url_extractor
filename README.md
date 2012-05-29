# Twitter URL Extractor

## Copyright and Licensing

### Copyright Notice

The copyright for the software, documentation, and associated files are
held by the author.

    Copyright 2012 Todd A. Jacobs
    All rights reserved.

The AUTHORS file is also included in the source tree.

### Software License

![GPLv3 Logo](http://www.gnu.org/graphics/gplv3-88x31.png)\


The software is licensed under the
[GPLv3](http://www.gnu.org/copyleft/gpl.html). The LICENSE is also
included in the source tree.

### README License

![Creative Commons BY-NC-SA
Logo](http://i.creativecommons.org/l/by-nc-sa/3.0/us/88x31.png)\


This README is licensed under the [Creative Commons
Attribution-NonCommercial-ShareAlike 3.0 United States
License](http://creativecommons.org/licenses/by-nc-sa/3.0/us/).

## Purpose

This is a small tool for extracting HTTP URIs from a search of Twitter
hashtags. Given a hashtag, it returns a list of unique links found
within the 100 most-recent matching tweets (if any).

## Caveats

* The regular expression for extractions will not catch uncommon (but
  valid) non-HTTP schemes.

## Supported Ruby Versions

The software was tested against Ruby 1.9.3-p125. Ruby 1.8.x is
unsupported.

## Usage

    ruby twitter_url_extractor.rb <hashtag>

## Examples

These are examples of what you might do when running
twitter_url_extractor.rb from the command line.

    # Count the number of links in the 100 most-recent tweets.
    $ ruby twitter_url_extractor.rb rails | wc -l
    47

    # Find "#rails" tweets, and grab the first link found.
    $ ruby twitter_url_extractor.rb rails | head -n1
    http://t.co/0E5AADWo

----
