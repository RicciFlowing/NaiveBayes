require "NaiveBayes/version"
require "NaiveBayes/TrainingExamples"

module NaiveBayes
  class TextClassifier
    def initialize( training_examples_path = 'training/')
      @examples = TrainingExamples.new(training_examples_path)
    end


    def classify(path:"", text:"", silent_output: false)
      @text = String.new

      unless text.empty?
        @text += text
      end
      # If both path and text is given both will be concatenated
      unless path.empty?
        @text += loadText(path)
      end

      return if @text.empty?

      words = @text.split(/\W+/)
      words = words.slice(0,100) # Use only the first 100 words for classification

      pIsInteristing = calculateProbabilities(words, "I")
      pIsNotInteristing = calculateProbabilities(words, "!I")

       if pIsInteristing > pIsNotInteristing
         unless silent_output
           puts "The text:"
           puts "\t"+@text.slice(0,50)+"..."
           puts "seems to be interisting"+ "\n\n"
         end
         return true
       else
         unless silent_output
           puts "The text:"
           puts "\t"+@text.slice(0,50)+"..."
           puts "seems to be not interisting"+ "\n\n"
         end
         return false
       end
    end

    private
      def loadText(path)
        begin
        loaded_text = File.read(path)
        rescue
          puts "You tried to load the file #{path} for classification. This file was not found.
           Please make sure, that the path is correctly spelled and that you have reading-access to the path given"
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
