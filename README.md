# NaiveBayes
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

```require_relative 'lib/TextClassifier.rb'

Now instantiate a new TextClassifier:

```classifier = TextClassifier.new()

Now you can start classifying texts (be sure to use a path to a text not a text itself as argument for the classify method):

```classifier.classify("path/to/text")

Classify will return a boolean true for interesting (and a false for not interesting).

Have fun using it!
