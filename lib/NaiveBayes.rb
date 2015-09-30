require "NaiveBayes/version"
require "NaiveBayes/ExamplesGroup"
require "NaiveBayes/PropabilityCollection"
require "NaiveBayes/PropabilityCalculator"
require "NaiveBayes/TextClassifier"
require "NaiveBayes/Text"
require "NaiveBayes/Category"
require "NaiveBayes/Categories"
require "NaiveBayes/CategoriesFactory"

module NaiveBayes
  extend self

  def build(config)
    begin
      @categories = CategoriesFactory.build(config)
      @test_classifier = TextClassifier.new(categories: @categories)
    rescue
      puts "Their seems to be an error in your config.
       The expectedt format is [{name: name_of_category, path: path_to_trainings_data}]"
    end
  end

  def classify(text)
    begin
      @text = Text.new(text: text, classifier: @test_classifier)
      @text.classify
    rescue
      puts "An Error occured. Did you call NaiveBayes.build before using classify"
    end
  end
end
