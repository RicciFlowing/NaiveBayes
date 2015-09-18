require "NaiveBayes/version"
require "NaiveBayes/TrainingExamples"
require "NaiveBayes/Text"

module NaiveBayes
  class TextClassifier
    def initialize( text=Text.new(text:""), training_examples_path = 'training/')
      @text = text
      @examples = TrainingExamples.new(training_examples_path)
    end


    def classify( silent_output: false)
      words = @text.words

      pIsInteristing = calculateProbabilities(words, "I")
      pIsNotInteristing = calculateProbabilities(words, "!I")

       if pIsInteristing > pIsNotInteristing
         unless silent_output
           puts "The text:"
           puts "\t"+@text.sample+"..."
           puts "seems to be interisting"+ "\n\n"
         end
         return true
       else
         unless silent_output
           puts "The text:"
           puts "\t"+@text.sample+"..."
           puts "seems to be not interisting"+ "\n\n"
         end
         return false
       end
    end


      def calculateProbabilities(list_of_words, klass)
        p = @examples.p_apriori(klass)
        list_of_words.each do |word|
          p *= @examples.p(word,klass)
        end
        return p
      end
  end

end
