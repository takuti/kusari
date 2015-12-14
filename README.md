# :link: Kusari [![Gem Version](https://badge.fury.io/rb/kusari.png)](https://badge.fury.io/rb/kusari) [![Build Status](https://travis-ci.org/takuti/kusari.svg?branch=master)](https://travis-ci.org/takuti/kusari)

Japanese random sentence generator based on Markov chain.

## Installation

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

In addition to the above operations, we can save the tokenized word table on local as:

```ruby
generator.save("tokenized_table.markov")
```

And it can be loaded by:

```ruby
generator.load("tokenized_table.markov")
```

Finally, we can obtain randomly generated sentence as:

```ruby
generator.generate(140)
# => "ネロは、アルデンネ生まれの兄弟よりも仲のよい大の少年でした。"
```

Here, an argument of the generate method defines limit length for the generated sentence; `generator.generate(140)` creates a sentence which can be posted on Twitter, for example.

## License

MIT
