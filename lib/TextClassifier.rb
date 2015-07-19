require_relative 'TrainingExamples.rb'

class TextClassifier
  def initialize( training_examples_path = 'training/')
    @examples = TrainingExamples.new(training_examples_path)
  end


  def classify(path)
    begin
    @text = File.read(path)
    rescue
      puts "You tried to load the file #{path} for classification. This file was not found.
       Please make sure, that the path is correctly spelled and that you have reading-access to the path given"
      return
    end
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
