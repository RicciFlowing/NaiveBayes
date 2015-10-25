# NaiveText

A naive Bayes Textclassifier written in Ruby

1. What does it do?
----

It sorts texts into predefined categories (i.e. interesting/boring).
The algorithm bases its decisions on classified trainingdata (text files, ActiveRecord models,...).

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



### Example

Lets pretend you write some kind of forum. A user can write posts and can vote them up or down.


We will build a system which predicts if a new post is interesting to the user or if this post will bore him a sleep.

In your system (an rails app of course) you haven a *Post* model with a text attribute containing the posts content. There are also two scopes on Post: *up_voted* and *down_voted*, which return all up/down voted posts.



```ruby
require 'NaiveText'

interesting_examples = Post.up_voted.to_a
boring_examples = Post.down_voted.to_a

categories = [{name: 'interesting', examples: interesting_examples},
                     {name: 'boring', examples: boring_examples}];

classifier = NaiveText.build(categories: categories)

category = classifier.classify(new_interesting_post.text)
category.name
 => 'interesting'
```
Checkout the full example and some more in the
[NaiveText-example repo](https://github.com/RicciFlowing/NaiveText-examples).
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
