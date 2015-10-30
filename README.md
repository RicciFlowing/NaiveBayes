# NaiveText

NaiveText is a text classifier gem written in ruby and made to be easily integratable in your Rails app.

## What is it good for?

Text classifier are used in many areas of IT. The filter spam, predict what a user wants to buy, detect which language a text is written in, ...

The kind of classifier included in NaiveText, uses existing text examples (junk-makrde e-mails, allready bought products, texts in different languages, ...) to calculate in which category (spam/e-mail, interesting_product/not_interesting_product, ...) a unknown text belongs.

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

interesting_examples = Post.up_voted
boring_examples = Post.down_voted

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

## Contributing

1. Fork it ( https://github.com/RicciFlowing/NaiveText/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
