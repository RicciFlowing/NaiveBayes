class Text
  attr_reader :words
  def initialize( args  )
    @text = args[:text] || ""
    path  = args[:path]
    @classifier = args[:classifier] || TextClassifier.new
    # If both path and text is given both will be concatenated
    @text += loadText(path) if path

    @words = @text.split(/\W+/)
  end

  def sample
    @text.slice(0,50)
  end

  def classify
    @classifier.get_category_for(words)
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

end
