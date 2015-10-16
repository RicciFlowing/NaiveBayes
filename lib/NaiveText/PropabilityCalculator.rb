class PropabilityCalculator
  def initialize(args)
    @categories = args[:categories] || []
    @propabilities = PropabilityCollection.new(categories: @categories)
  end

  def get_propabilities_for(text)
    calculateProbabilities(text)
    normalize unless @propabilities.sum < 0
    @propabilities
  end


  private
    def minimum
      minimum = 1.to_f/(10*@categories.total_word_count)
    end

    def min_factor(factor)
      if factor.to_f < minimum
        factor = minimum
      end
      factor
    end

    def calculateProbabilities(text)
      list_of_words = text.split(/\W+/)
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
