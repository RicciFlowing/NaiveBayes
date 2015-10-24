# NaiveText

A naive Bayes Textclassifier written in Ruby

1. What does it do?
----

It sorts text into predefined categories (i.e. interesting/boring).
The algorithm bases its decisions on given text examples.

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

Create a directory for the trainings-data containing subdirectories for every category (i.e. 'interesting' and 'boring'). Fill the directories with examples for interesting/boring texts.

Next up, the code:

```ruby
require 'NaiveText'
```
Now build the systems with your categories and training texts:

```ruby
interesting_examples = ExamplesFactory.from_files('spec/training/positive')
boring_examples = ExamplesFactory.from_files('spec/training/negative')
categories = [{name: 'interesting', examples: interesting_examples},
                     {name: 'boring', examples: boring_examples}];

classifier = NaiveText.build(categories: categories)
```
Now you can start classifying texts:

```ruby
classifier.classify('Seems to be interesting')
classifier.classify('Seems to be boring')
```
Classify will return a category-object on which you can call name to get the name of the category as a string.

```ruby
category = classifier.classify('Something interesting')
category.name
 => 'interesting'
```

Have fun using it!


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/RicciFlowing/NaiveText/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
