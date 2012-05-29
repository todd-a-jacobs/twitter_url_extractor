# Twitter URL Extractor

## Copyright and Licensing

### Copyright Notice

The copyright for the software, documentation, and associated files are
held by the author.

    Copyright 2012 Todd A. Jacobs
    All rights reserved.

The AUTHORS file is also included in the source tree.

### Software License

![GPLv3 Logo](http://www.gnu.org/graphics/gplv3-88x31.png)

The software is licensed under the
[GPLv3](http://www.gnu.org/copyleft/gpl.html). The LICENSE is also
included in the source tree.

### README License

![Creative Commons BY-NC-SA
Logo](http://i.creativecommons.org/l/by-nc-sa/3.0/us/88x31.png)

This README is licensed under the [Creative Commons
Attribution-NonCommercial-ShareAlike 3.0 United States
License](http://creativecommons.org/licenses/by-nc-sa/3.0/us/).

## Purpose

This is a small tool for extracting HTTP URIs from a search of Twitter
hashtags. Given a hashtag, it returns a list of unique links found
within the 100 most-recent matching tweets (if any).

## Caveats

1. Don't expect truly pathological input to yield valid URIs.

2. Technically valid URIs may still point to the wrong place, or to
   non-existent resources. Filtering broken links is a job for a
   link-checker, not a link-extractor.

3. May not catch uncommon (but valid) URI schemes. If you find one,
   please report it.

4. Works best when the URL contains an explicit URI scheme.

5. Will not find malformed URLs that consist solely of a top-level
   domain without a URI prefix, e.g. "example.com/foo" will match but
   just "example.com/" will not.

6. Will not handle run-on sentences without trailing whitespace. For
   example:

        "Go to http://example.com/foo.It's really cool!"
        => ["http://example.com/foo.It's"]
  Even explicitly matching against all [top-level
  domains](http://en.wikipedia.org/wiki/Top-level_domain) won't solve
  the problem. If you find a solution, please submit a pull request.

7. Can't handle literal smart-quotes embedded in the URL, since the
   closing quote is a used as one of the stop characters for quoted
   URIs.

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
[Project Home Page](https://github.com/CodeGnome/twitter_url_extractor)
