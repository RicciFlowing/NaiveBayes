require "NaiveText/version"
require "NaiveText/ExamplesGroup"
require "NaiveText/PropabilityCollection"
require "NaiveText/PropabilityCalculator"
require "NaiveText/TextClassifier"
require "NaiveText/Category"
require "NaiveText/Categories"
require "NaiveText/CategoriesFactory"



module NaiveText

  def self.build(config)
    begin
      @categories = CategoriesFactory.build(config)
      @test_classifier = TextClassifier.new(categories: @categories)
    rescue
      puts "Their seems to be an error in your config.
       The expectedt format is [{name: name_of_category, path: path_to_trainings_data}]"
    end
  end
end
