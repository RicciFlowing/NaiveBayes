class TextClassifier
  attr_reader :categories
  def initialize( args )
    @categories = args[:categories]
    @calculator = args[:calculator] || ProbabilityCalculator.new(categories: @categories)
  end

  def classify(text)
    get_category_for(text)
  end

  def probabilities(text)
    @calculator.get_probabilities_for(text)
  end

  def propabilities(text)
    puts "This notation is deprecated in will be removed in later versions. Please use probabilities (4th character b instead of p)"
    probabilities(text)
  end

private
  def get_category_for(text)
    probabilities = @calculator.get_probabilities_for(text)
    @categories.each do |category|
      probabilities.multiply(category: category, factor: category.weight)
      puts category.weight
    end
    probabilities.category_with_max
  end
end
