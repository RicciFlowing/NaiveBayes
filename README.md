# NaiveText

A naive Bayes Textclassifier written in Ruby

1. What does it do?
----

It sorts texts into predefined categories (i.e. interesting/boring).
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

The algorithm needs some examples for training. An example is a object that responds to text with a string (i.e. ActiveRecord models with an text attribute will do).
You can also use ExamplesFactory.from_files('path/to/dir') will create an array of examples out of files in a category.


### example

You have an ActiveRecord model named Post which contains its content in the text attribute. A user can vote a post up or down. There are also two scopes on Post: up_voted and down_voted, which responds with all up/down voted posts.

We will build a system which predicts if a new post is interesting to the user or if it will bore him a sleep.

```ruby
require 'NaiveText'

interesting_examples = Posts.up_voted
boring_examples = Posts.down_voted
categories = [{name: 'interesting', examples: interesting_examples},
                     {name: 'boring', examples: boring_examples}];

classifier = NaiveText.build(categories: categories)

category = classifier.classify(new_interesting_post.text)
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
