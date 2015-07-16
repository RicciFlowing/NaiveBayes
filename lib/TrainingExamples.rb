class TrainingExamples
  def initialize(path)
    @path = path
    @positive_texts = Array.new
    @negative_texts = Array.new
    @positive_words = Array.new
    @negative_words = Array.new

    Dir.foreach(@path + 'positive/') do |example_file|
      next if example_file == '.' or example_file == '..'
        @positive_texts << File.read(@path +'positive/' + example_file)
      end

    Dir.foreach(@path + 'negative/') do |example_file|
      next if example_file == '.' or example_file == '..'
        @negative_texts << File.read(@path +'negative/' + example_file)
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

end
