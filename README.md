# :link: Kusari

Japanese random sentence generator based on Markov chain.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kusari'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kusari

## Usage

First of all, our application must load the gem and create a new instance as:

```ruby
require 'kusari'
generator = Kusari::Generator.new
# by default, the above statement is the same as:
#   generator = Kusari::Generator.new(3, "./ipadic")
```

Note that the first argument `3` indicates N for the N-gram model used by creating tokenized word table. You can give arbitrary number. And the second one `./ipadic` tells the path of [IPA dictionary](http://taku910.github.io/mecab/#download), a dictionary for parsing Japanese strings, to the generator.

Next, adding strings (reference sentences for Markov chain) can be done by:

```ruby
generator.add_string("ネロとパトラッシュは、この世で二人きりでした。")
generator.add_string("彼らは、実の兄弟よりも仲のよい大の親友でした。")
generator.add_string("ネロは、アルデンネ生まれの少年でした。")
```

Finally, we can obtain randomly generated sentence as:

```ruby
sentence = generator.generate(140)
p sentence
# => "ネロは、アルデンネ生まれの兄弟よりも仲のよい大の少年でした。"
```

Here, an argument of the generate method defines limit length for the generated sentence; `generator.generate(140)` creates a sentence which can be posted on Twitter, for example.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takuti/kusari. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

