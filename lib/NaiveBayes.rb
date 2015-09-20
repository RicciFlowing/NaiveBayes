require "NaiveBayes/version"
require "NaiveBayes/TrainingExamples"
require "NaiveBayes/Text"

module NaiveBayes
  class TextClassifier
    def initialize( text=Text.new(text:""), examples = TrainingExamples.new('training/') )
      @text = text
      @examples = examples
    end


    def classify()
      pIsInteristing = calculateProbabilities(@text.words, "I")
      pIsNotInteristing = calculateProbabilities(@text.words, "!I")

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

end
