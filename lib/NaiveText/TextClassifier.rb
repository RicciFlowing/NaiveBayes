class TextClassifier
  attr_reader :categories
  def initialize( args )
    @categories = args[:categories]
    @calculator = args[:calculator] || PropabilityCalculator.new(categories: @categories)
  end

  def classify(text)
    get_category_for(text)
  end

  def propabilities(text)
    @calculator.get_propabilities_for(text)
  end

private
  def get_category_for(text)
    propabilities = @calculator.get_propabilities_for(text)
    propabilities.category_with_max
  end
end
