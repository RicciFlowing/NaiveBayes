class PropabilityCollection < Struct.new(:interesting, :not_interesting)

  def *(probalities)
    PropabilityCollection.new(self.interesting      * probalities.interesting,
                              self.not_interesting  * probalities.not_interesting)
  end
end

class TrainingExamples
  def initialize(args)
    @path = args[:path] || 'training/'
    @positive_examples = ExamplesGroup.new(@path+'positive/')
    @negative_examples = ExamplesGroup.new(@path+'negative/')
  end

  def get_propalities_for(words)
    calculateProbabilities(words)
  end

  private

    def calculateProbabilities(list_of_words)
      probalities = p_apriori()
      list_of_words.each do |word|
        probalities = probalities * p(word)
      end
      return probalities
    end

    def p_apriori()
      p_interesting     = @positive_examples.word_count.to_f / (@positive_examples.word_count + @negative_examples.word_count)
      p_not_interesting = @negative_examples.word_count.to_f / (@positive_examples.word_count + @negative_examples.word_count)
      probalities       = PropabilityCollection.new(p_interesting,p_not_interesting )
    end

    def p(word)
      p_interesting     = (@positive_examples.count(word).to_f / @positive_examples.word_count)
      p_not_interesting = (@negative_examples.count(word).to_f / @negative_examples.word_count)
      probalities       =  PropabilityCollection.new(p_interesting,p_not_interesting)
    end


end
