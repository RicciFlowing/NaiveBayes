class Categories
  include Enumerable

  def initialize(args)
    @categories = args[:categories] || []
  end

  def p_apriori(category)
    calculate_apriori_propability_for(category)
  end

  def each(&block)
    @categories.each(&block)
  end

  def total_word_count
    @categories.inject(0) { |count, category | count + category.word_count  }
  end

  private

   def calculate_apriori_propability_for(category)
     sum_of_words = @categories.inject(0) {|sum, category| sum + category.word_count }
     category.word_count.to_f / sum_of_words
   end

end
