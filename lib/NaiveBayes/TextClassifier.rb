class TextClassifier
  def initialize( examples = TrainingExamples.new )
    @examples = examples
  end


  def classify(words)
    propabilities = @examples.get_propabilities_for(words)

    return propabilities.interesting > propabilities.not_interesting
  end

end
