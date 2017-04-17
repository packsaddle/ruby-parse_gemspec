# ParseGemspec

[![Gem version][gem-image]][gem-url] [![Travis-CI Status][travis-image]][travis-url]

> Parse *.gemspec file. Convert to Ruby Hash Object.

See [parse_gemspec-cli](https://rubygems.org/gems/parse_gemspec-cli) ([repo](https://github.com/packsaddle/ruby-parse_gemspec-cli)) for the command-line version.


## Usage

```ruby
require 'parse_gemspec'

gemspec_path = 'path/to/you_want_to_parse.gemspec'
ParseGemspec::Specification.load(gemspec_path).to_hash_object
=> {:name=>"you_want_to_parse",
 :version=>"1.3.0",
 :authors=>["sanemat"],
 :description=>"Description you want to parse.",
 :email=>["you_want_to_parse@example.com"],
 :homepage=>"https://example.com/you_want_to_parse",
 :licenses=>["MIT"],
 :metadata=>{},
 :summary=>"Summary you want to parse."}
```


## API

### ParseGemspec::Specification.load(file) -> ParseGemspec::Specification

#### file

*Required*
Type: `string`

`*.gemspec`'s path.

### ParseGemspec::Specification#to_hash_object -> Hash

#### Hash's keys

* name
* version
* authors
* description
* email
* homepage
* licences
* metadata
* summary


## Changelog

[changelog.md](./changelog.md).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parse_gemspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parse_gemspec


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/packsaddle/ruby-parse_gemspec. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

© [sanemat](http://sane.jp)

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[travis-url]: https://travis-ci.org/packsaddle/ruby-parse_gemspec
[travis-image]: https://img.shields.io/travis/packsaddle/ruby-parse_gemspec/master.svg?style=flat-square&label=build%20%28linux%29
[gem-url]: https://rubygems.org/gems/parse_gemspec
[gem-image]: http://img.shields.io/gem/v/parse_gemspec.svg?style=flat-square
