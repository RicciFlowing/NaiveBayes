class TrainingExamples
  def initialize(path)
    @path = path
    @positive_texts = Array.new
    @negative_texts = Array.new
    @positive_words = Array.new
    @negative_words = Array.new
    begin
    load_examples_for('positive')
    load_examples_for('negative')
    rescue
      puts "You tried to load the training examples from #{@path}. This directory does not exist. Please spellcheck the path."
      abort
    end
    @positive_texts.each do |text|
      @positive_words += text.split(/\W+/)
    end

    @negative_texts.each do |text|
      @negative_words += text.split(/\W+/)
    end
  end

  def p_apriori(arg)
    case arg
    when 'I'
      return @positive_texts.length.to_f / (@positive_texts.length + @negative_texts.length)
    when '!I'
      return @negative_texts.length.to_f / (@positive_texts.length + @negative_texts.length)
    end
  end

  def p( word, klass)
    if klass=='I'
      words  =  @positive_words
      text_count = @positive_texts.length
    else
      words = @negative_words
      text_count = @negative_texts.length
    end

    count = 0
    words.each do |word_in_klass|
      if word === word_in_klass
        count += 1
      end
    end
    probability = (count.to_f / text_count) + 0.01
  end

  def print
    puts "Positiv:"
    puts @positive_texts
    puts "Negativ:"
    puts @negative_texts
  end

  private

    def load_examples_for(rating)
      texts = Array.new
      Dir.foreach(@path + rating) do |example_file|
        next if example_file == '.' or example_file == '..'
          texts << File.read(@path  +rating +'/' + example_file)
        end

      if(rating ==="positive")
        @positive_texts = texts
      else
        @negative_texts = texts
      end
    end

end
