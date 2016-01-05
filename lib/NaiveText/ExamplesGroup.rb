class ExamplesGroup
  def initialize(args)
    @examples       = args[:examples].to_a || []
    @language_model = args[:language_model] || ->(str) { str }
    load_text
    split_text_into_words
    format_words
    fail 'Empty_Trainingsdata' if @words.length == 0
  end

  def count(word)
    @words.count(@language_model.call(word.downcase))
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
    @words.map!(&:downcase)
    @words.map! { |word| @language_model.call(word) }
    @words
  end
end
