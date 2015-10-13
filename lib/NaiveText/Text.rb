class Text
  attr_reader :words
  def initialize( args  )
    @text = args[:text] || ""
    @classifier = args[:classifier] || TextClassifier.new
    # If both path and text is given both will be concatenated
    @text += loadText(path) if path

    @words = @text.split(/\W+/)
  end

  def classify
    @classifier.get_category_for(words)
  end


end
