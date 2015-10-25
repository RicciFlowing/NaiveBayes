require "NaiveText/version"
require "NaiveText/Example"
require "NaiveText/ExamplesFactory"
require "NaiveText/ExamplesGroup"
require "NaiveText/PropabilityCollection"
require "NaiveText/PropabilityCalculator"
require "NaiveText/TextClassifier"
require "NaiveText/Category"
require "NaiveText/Categories"
require "NaiveText/CategoriesFactory"



module NaiveText

  def self.build(config)
      @categories = CategoriesFactory.build(config)
      @test_classifier = TextClassifier.new(categories: @categories)
  end
end
