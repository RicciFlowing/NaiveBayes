class TextClassifier
  def initialize( examples = TrainingExamples.new )
    @examples = examples
  end


  def classify(words)
    probalities = @examples.get_propabilities_for(words)

    return probalities.interesting > probalities.not_interesting
  end

end
