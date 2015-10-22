class Example
  attr_reader :text

  def initialize(args)
    load_text(args)
  end

  private
    def load_text(args)

    end
end

class FileExample < Example
  private
    def load_text(args)
      @text = File.read(args[:path])
    end
end
