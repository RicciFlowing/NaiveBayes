# NaiveBayes

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/NaiveBayes`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

A naive Bayes Textclassifier written in Ruby

1. What does it do?
----

It sorts text into to categories ("Interesting"/"Not Interesting").
The Algorithm bases the decisions on prior human sorted examples.

2. How do I use it?
----

An example is given in the example folder.

In brief the process is as follows:

Create a directory (preferrable training) containing to subdirectories 'positive/' and 'neagtive/'.
In the 'positive' directory you put examples for interesting texts. Same for the negative directory and not interesting texts. This will the training material for the algorithm.

Next up: Requiring the lib/TextClassifier.rb file :

```ruby
require_relative 'lib/TextClassifier.rb'
```
Now instantiate a new TextClassifier:

```ruby
classifier = TextClassifier.new()
```
Now you can start classifying texts:

```ruby
classifier.classify(path: "/path/to/file")
classifier.classify(text: "Your text here")
```
Classify will return a boolean true for interesting (and a false for not interesting).

Have fun using it!


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/NaiveBayes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
