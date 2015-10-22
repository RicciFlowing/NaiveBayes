class Example
  attr_reader :text

  def initialize(path)
    @text = load_text(path)
  end

  private
    def load_text(path)
      @text = File.read(path)
    end
end
