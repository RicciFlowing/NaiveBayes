class TextClassifier
  attr_reader :categories
  def initialize( args )
    @categories = args[:categories]
    @calculator = args[:calculator] || PropabilityCalculator.new(categories: @categories)
  end

  def classify(text)
    words = text.split(/\W+/)
    get_category_for(words)
  end

  def propabilities(text)
    get_propabilities(text)
  end

private
  def get_category_for(list_of_words)
    propabilities = @calculator.get_propabilities_for(list_of_words)
    propabilities.max
  end

  def get_propabilities(text)
    words = text.split(/\W+/)
    @calculator.get_propabilities_for(words)
  end

end
