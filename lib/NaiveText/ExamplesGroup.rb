class ExamplesGroup
  def initialize(args)
    @examples = args[:examples] || []
    load_text
    split_text_into_words
    format_words
    if @words.length == 0
      raise 'Empty_Trainingsdata'
    end
  end

  def count(word)
    @words.count(word.downcase)
  end

  def word_count
    @words.count
  end

  private

    def load_text
      @text = ''
      @examples.each do |example|
        @text += ' ' + example.text
      end
    end

    def split_text_into_words
      @words = @text.split(/\W+/)
    end

    def format_words
      @words.map! {|word| word.downcase}
    end
end
