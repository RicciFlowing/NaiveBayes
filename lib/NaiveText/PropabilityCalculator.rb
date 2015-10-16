class PropabilityCalculator
  def initialize(args)
    @categories = args[:categories] || []
    @propabilities = PropabilityCollection.new(categories: @categories)
  end

  def get_propabilities_for(words)
    calculateProbabilities(words)
    if(@propabilities.sum > 0)
      normalize
    end
    @propabilities
  end

  def minimum
    minimum = 0.1 * 1.to_f/total_word_count
  end

  private
    def total_word_count
      @categories.inject(0) { |count, category | count + category.word_count  }
    end

    def min_factor(factor)
      if factor.to_f < self.minimum
        factor = self.minimum
      end
      factor
    end

    def calculateProbabilities(list_of_words)
      @categories.each do |category|
        @propabilities.set(category: category, value: p_apriori(category))
      end

      list_of_words.each do |word|
        @categories.each do |category|
          @propabilities.multiply(category: category, factor: min_factor(category.p(word)) )
        end
      end
    end

    def normalize
      normalization_factor = 1.to_f / @propabilities.sum
      @propabilities.multiply(factor: normalization_factor)
    end

    def p_apriori(category)
      @categories.p_apriori(category)
    end



end
