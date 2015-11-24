# NaiveText

NaiveText is a text classifier gem written in ruby and made to be easily integratable in your Rails app.

## What is it good for?

Text classifier are used in many areas of IT. The filter spam, predict what a user wants to buy, detect which language a text is written in, ...

The kind of classifier included in NaiveText, uses existing text examples (junk-makrde e-mails, already bought products, texts in different languages, ...) to calculate in which category (spam/e-mail, interesting_product/not_interesting_product, ...) a unknown text belongs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'NaiveText'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install NaiveText

## Usage

The algorithm needs some examples for training. An example is a object with an id that responds to the text message with a string (i.e. ActiveRecord models with an text attribute will do).
You can also use local files as examples (via ExamplesFactory.from_files('path/to/dir')).



## Example

Can be found on the projects [homepage](https://ricciflowing.github.io/NaiveText/).

## Contributing

1. Fork it ( https://github.com/RicciFlowing/NaiveText/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
