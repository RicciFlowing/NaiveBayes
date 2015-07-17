require_relative 'TrainingExamples.rb'

class TextClassifier
  def initialize( training_examples_path = 'training/')
    @examples = TrainingExamples.new(training_examples_path)
  end


  def classify(path)
    @text = File.read(path)
    words = @text.split(/\W+/)
    words = words.slice(0,100) # Use only the first 100 words for classification

    pIsInteristing = calculateProbabilities(words, "I")
    pIsNotInteristing = calculateProbabilities(words, "!I")

     if pIsInteristing > pIsNotInteristing
       puts "Interisting"
       return true
     else
       puts "Not interisting"
       return false
     end
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
