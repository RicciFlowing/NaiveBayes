class ExamplesGroup
  def initialize(path)
    @text = load_text(path)
    @words = @text.split(/\W+/)
    if @words.length == 0
      raise 'Empty_Trainingsdata'
    end
  end

  def count(word)
    @words.count(word)
  end

  def word_count
    @words.count
  end

  private

    def load_text(path)
      text = ""
      Dir.foreach(path) do |example_file|
        next if example_file == '.' or example_file == '..'
        text += File.read(path +'/'+ example_file)
      end
      text
    end
end
