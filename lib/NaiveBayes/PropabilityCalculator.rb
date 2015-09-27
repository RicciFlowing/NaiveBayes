class PropabilityCalculator
  def initialize(args)
    @categories = args[:categories] || []
    @propabilities = PropabilityCollection.new(@categories)
  end

  def get_propabilities_for(words)
    calculateProbabilities(words)
  end

  private

    def calculateProbabilities(list_of_words)
      categories.each do |category|
        @propabilities.set(category: category, value: p_apriori(category))
      end

      list_of_words.each do |word|
        categories.each do |category|
          @propabilities.mulitply(category: category, factor: category.p(word) )
        end
      end

      @probalities
    end

    def p_apriori(category)
      @categories.p_apriori(category)
    end



end
