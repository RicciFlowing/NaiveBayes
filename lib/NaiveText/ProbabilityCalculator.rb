class ProbabilityCalculator
  def initialize(args)
    @categories = args[:categories] || []
    @probabilities = ProbabilityCollection.new(categories: @categories)
  end

  def get_probabilities_for(text)
    calculateProbabilities(text)
    @probabilities.normalize
  end

  private

  def protect_factor(factor)
    [factor, minimum].max
  end

  def minimum
    1.to_f / (10 * @categories.total_word_count)
  end

  def calculateProbabilities(text)
    set_apriori_probabilities
    list_of_words = text.split(/\W+/)
    list_of_words.each do |word|
      @categories.each do |category|
        @probabilities.multiply(category: category, factor: protect_factor(category.p(word)))
      end
    end
    remove_minimum(text)
  end

  def set_apriori_probabilities
    @categories.each do |category|
      @probabilities.set(category: category, value: @categories.p_apriori(category))
    end
  end

  def remove_minimum(text)
    times = text.split(/\W+/).length
    @probabilities.greater_then(minimum**times)
  end
end
