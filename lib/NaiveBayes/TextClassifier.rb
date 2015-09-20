class TextClassifier
  def initialize( examples = TrainingExamples.new )
    @examples = examples
  end


  def classify(words)
    pIsInteristing = calculateProbabilities(words, "I")
    pIsNotInteristing = calculateProbabilities(words, "!I")

    return pIsInteristing > pIsNotInteristing
  end

  private
    def calculateProbabilities(list_of_words, klass)
      p = @examples.p_apriori(klass)
      list_of_words.each do |word|
        p *= @examples.p(word,klass)
      end
      return p
    end

end
