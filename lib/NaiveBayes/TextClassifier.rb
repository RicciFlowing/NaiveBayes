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

    def render_output
      unless silent_output
        puts "The text:"
        puts "\t"+@text.sample+"..."
        puts "seems to be interisting"+ "\n\n"
      end
      unless silent_output
        puts "The text:"
        puts "\t"+@text.sample+"..."
        puts "seems to be not interisting"+ "\n\n"
      end
    end


end
