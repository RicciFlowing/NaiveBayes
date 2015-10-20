class PropabilityCalculator
  def initialize(args)
    @categories = args[:categories] || []
    @propabilities = PropabilityCollection.new(categories: @categories)
  end

  def get_propabilities_for(text)
    calculateProbabilities(text)
    normalize unless @propabilities.sum <= 0
    @propabilities
  end


  private
    def protect_factor(factor)
      [factor, minimum].max
    end

    def minimum
      1.to_f/(10*@categories.total_word_count)
    end

    def calculateProbabilities(text)
      set_apriori_propabilities
      list_of_words = text.split(/\W+/)
      list_of_words.each do |word|
        @categories.each do |category|
          @propabilities.multiply(category: category, factor: protect_factor(category.p(word)) )
        end
      end
      remove_minimum(text)
    end

    def set_apriori_propabilities
      @categories.each do |category|
        @propabilities.set(category: category, value: p_apriori(category))
      end
    end

    def remove_minimum(text)
      times = text.split(/\W+/).length
      @propabilities.greater_then(minimum**times)
    end

    def normalize
      normalization_factor = 1.to_f / @propabilities.sum
      @propabilities.multiply(factor: normalization_factor)
    end

    def p_apriori(category)
      @categories.p_apriori(category)
    end
end
