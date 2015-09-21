class TextClassifier
  def initialize( examples = TrainingExamples.new )
    @examples = examples
  end


  def classify(words)
    probalities = @examples.get_propalities_for(words)

    return probalities.interesting > probalities.not_interesting
  end

end
