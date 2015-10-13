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

  private

    def calculateProbabilities(list_of_words)
      @categories.each do |category|
        @propabilities.set(category: category, value: p_apriori(category))
      end

      list_of_words.each do |word|
        @categories.each do |category|
          @propabilities.multiply(category: category, factor: category.p(word) )
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
