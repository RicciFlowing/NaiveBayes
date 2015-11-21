---
layout: post
title:  "Spam filter"
date:   2015-11-16 10:41:56
categories: 'post'
---

In this example we will write a simple spam filter integrated in a rails app which lists user posts. It shows you how you can reduce spam in user created rails models.

So we begin by creating a simple rails app.

```
$ rails new SpamFree
```
And scaffold the posts resource, which contains one field for the posts text and one for the content\_type. The content\_type of a post is one of the following strings:

 'spam',  'content' or 'verified\_content'

and will be set by our spam filter. As you will assume models with a content\_type of 'spam' are spam and aren't accessible by the user. The difference between 'verified\_content' and 'content' is, that veriefied\_content is checked by you (or a moderator) and is guaranteed to contain no spam. It is used to train the spam
filter.

So go ahead an scaffold your rails app:

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

The actual spam filter is pretty simple. (It is actually a singleton ruby class with one public method):

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

We also need to remove the content\_type from our permitted parameters. This way no user can submit a post and send a content\_type along.

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

Before we can use our app, we need to make sure to put some example posts in our seed file

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
* Verification: You need to manually verify content to get good results.
* Unflexible: Right now a user can't mark posts as spam nor can he do anything if their post a falsliy classified as spam.


Make sure to checkout the [source code](https://github.com/RicciFlowing/NaiveText-examples/tree/master/easy/spam_filter_2).
