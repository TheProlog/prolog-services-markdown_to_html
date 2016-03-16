# Prolog::Services::MarkdownToHtml

This Gem was extracted from a number of internally-developed applications, which should somewhat explain the namespacing and the initial version number being set to `1.0.0`.

The Gem provides an (extremely) simple API for converting valid Markdown content, including embedded HTML, to valid HTML that "just happens" to be well-formed XML. This means, *inter alia,* that

- *supported* [void elements](https://www.w3.org/TR/html-markup/syntax.html#void-element) are guaranteed to be properly closed, where *supported elements* are `<br/>`, `<hr/>`, and `<img …/>`.  Each of these supports standard HTML [global attributes](https://www.w3.org/TR/html-markup/global-attributes.html), and the `img` tag supports its defined [permitted attributes](https://www.w3.org/TR/html-markup/img.html#img-attributes);
- all non-space whitespace characters are replaced with single space characters; thereby
- returning all content as a single "line" of text.

This is not completely without problems, as careful consideration will reveal. (Code snippets, anyone?)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prolog-services-markdown_to_html'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install prolog-services-markdown_to_html
```

## Usage

The `Prolog::Services::MarkdownToHtml.call` method takes a named `content:` parameter, returning the equivalent HTML.

```ruby
require 'prolog/services/markdown_to_html'

include Prolog::Services;

html = MarkdownToHtml.call content: 'This is simple text.'
# => "<p>This is simple text.</p>"

content = "# Hello, World\n\nThis is simple text."
html = MarkdownToHtml.call content: content
# => "<h1>Hello, World</h1><p>This is simple text.</p>"

content = "This is some text.\nThis is more text."
html = MarkdownToHtml.call content: content
"<p>This is some text.<br/>This is more text.</p>"

content = "Testing.\n\n----\n\nMore testing.\n\n<hr id='hr-01'/>\n\nDone."
html = MarkdownToHtml.call content: content
# => "<p>Testing.</p><hr/><p>More testing.</p><hr id=\"hr-01\"/><p>Done.</p>"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TheProlog/prolog-services-markdown_to_html. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
