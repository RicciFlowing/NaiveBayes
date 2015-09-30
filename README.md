# NaiveBayes

A naive Bayes Textclassifier written in Ruby

1. What does it do?
----

It sorts text into to categories predefined categories (i.e. interesting/boring).
The Algorithm bases the decisions on given text examples.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'NaiveBayes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install NaiveBayes

## Usage

In brief the process is as follows:

Create a directory (naming convention: training) containing subdirectories for every category (i.e. 'interesting' and 'boring').
Fill the directories with examples for interesting/boring texts. This will the training material for the algorithm.

Next up, the code:

```ruby
require 'NaiveBayes'
```
Now build the systems with your categories and training texts:

```ruby
categories_config = [{name: 'interesting', path: 'spec/training/positive'},
                     {name: 'boring', path: 'spec/training/negative'}]
NaiveBayes.build(categories_config)
```
Now you can start classifying texts:

```ruby
NaiveBayes.classify('Seems to be interesting')
NaiveBayes.classify('Seems to be boring')
```
Classify will return a category-object on which you can call name to get the name of the category as a string.

```ruby
category = NaiveBayes.classify('Something interesting')
category.name
 => 'interesting'
```

Have fun using it!


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/RicciFlowing/NaiveBayes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
