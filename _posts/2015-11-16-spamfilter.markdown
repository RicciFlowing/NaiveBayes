---
layout: post
title:  "Spam filter"
date:   2015-11-16 10:41:56
categories: 'post'
---

In this example we will integrate a simple spam filter for a rails app.
It shows you how you clean your user created rails models from spam.

First we will create a simple rails app.

```
$ rails new SpamFree
```
And scaffold the posts resource (containing one field for the posts text and one for the content type 'spam'/'content'/'verified_content'). Verified content in contrast to normal content is checked by you (or an admin) and is guaranteed to contain no spam:

```
$ rails g scaffold Post text:string content_type:string
$ rake db:migrate
```

We will need the NaiveText gem, so go ahead and put it in your Gemfile:

```
gem 'NaiveText'
```

Make sure to run bundler:

```
$ bundle
```

Also be sure to set the root route to 'posts#index'

For easier querying we add three scope to the Post model (learn more about scopes in the [rails guides](http://guides.rubyonrails.org/active_record_querying.html#scopes)).  

``` ruby
class Post < ActiveRecord::Base
  scope :spam, ->{ where(content_type: 'spam') }
  scope :content, ->{ where.not(content_type: 'spam') }
  scope :verified, ->{ where(content_type: 'verified_content') }
end
```

The actual spam filter is pretty simple. (It is actually a singletion ruby class with one public method):

``` ruby
class SpamFilter
  def self.spam?(post)
    self.build_classifer
    @classifier.classify(post.text).name == 'spam'
  end

  private
    def self.build_classifer
      categories_config = [{name: 'spam', examples: Post.spam, weight: 1},
                           {name: 'content', examples: Post.verified, weight: 10}]
      @classifier = NaiveText.build(categories: categories_config, default: 'content')
    end
end
```

To integrate the spam filter in our rails app. We need to to make some adjustments to the PostsController.
At first we want to only list posts which are not categorized as spam. So in the index action we replace Post.all with Post.content.

``` ruby
class PostsController < ApplicationController
  def index
    # Changed Post.all to Post.content
    @posts = Post.content
  end
  ...
```

Same for our set_post method.

``` ruby
    # Changed Post.find to Post.content.find
    def set_post
      @post = Post.content.find(params[:id])
    end
```

We also need to remove the content_type from our permited parameters. This way no user can submit a post and send a content_type along.

``` ruby
    # Remove content_type
    def post_params
      params.require(:post).permit(:text)
    end
```

The real filtering happens at the controllers create action: We simply ste the posts content_type based on the response of SpamFilter.spam?.

``` ruby
  def create
    @post = Post.new(post_params)
    if SpamFilter.spam?(@post)
      @post.content_type = 'spam'
    else
      @post.content_type = 'content'
    end
    respond_to
      ...
  end
```

Before we can use our app. Be sure to put some examples posts in your seed file

``` ruby
Post.create([{text: 'Hello I am a friendly post', content_type: 'verified_content'},
             {text: 'Arrgh this is a spam post', content_type: 'spam'}
             ])
```

and run

```
$ rake db:seed
```

## Conclusion

This solution, as it is, is just a first dip into the problematic of filtering spam from your user input.
There are some drawbacks in the current  solution:

* Performance: As described above, every request will query all posts to create the classifier.
* Verification: You need to verify content to get good results.

Make sure to checkout the [source code](https://github.com/RicciFlowing/NaiveText-examples/tree/master/easy/spam_filter_2).
