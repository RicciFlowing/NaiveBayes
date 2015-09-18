class Text
  attr_reader :words
  def initialize( path:"", text:"")
    @text = text
    # If both path and text is given both will be concatenated
    unless path.empty?
      @text += loadText(path)
    end
    @words = @text.split(/\W+/)
  end

  def sample
    @text.slice(0,50)
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
