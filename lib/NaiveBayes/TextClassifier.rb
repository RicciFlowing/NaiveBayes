class TextClassifier
  def initialize( args )
    @categories = args[:categories]
    @calculator = args[:calculator] || PropabilityCalculator.new(categories: @categories)
  end

  def get_category_for(list_of_words)
    propabilities = @calculator.get_propabilities_for(list_of_words)
    propabilities.max
  end

end
