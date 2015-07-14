class TextClassifier
  def initialize(path)
    @examples = TrainingExamples.new
    @text = File.read(path)
  end


  def classify()
    words = @text.split(/\W+/)
    words = words.slice(0,100) # Use only the first 100 words for classification
    pIsInteristing = @examples.p_apriori("I")
    words.each do |word|
      pIsInteristing *= @examples.p(word,"I")
    end
    pIsNotInteristing = @examples.p_apriori("!I")
    words.each do |word|
      pIsNotInteristing *= @examples.p(word,"!I")
    end
     if pIsInteristing > pIsNotInteristing
       puts "Interisting"
       puts [pIsInteristing, pIsNotInteristing]
     else
       puts "Not interisting"
       puts [pIsInteristing, pIsNotInteristing]
     end
  end
end

class TrainingExamples
  def initialize()
    @positive_texts = Array.new
    @negative_texts = Array.new

    Dir.foreach('examples/positive/') do |example_file|
      next if example_file == '.' or example_file == '..'
        @positive_texts << File.read('examples/positive/' + example_file)
      end

    Dir.foreach('examples/negative/') do |example_file|
      next if example_file == '.' or example_file == '..'
        @negative_texts << File.read('examples/negative/' + example_file)
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
      texts  =  @positive_texts
    else
      texts = @negative_texts
    end

    count = 0
    text_count = texts.length
    texts.each do |text|
           words = text.split(/\W+/)
          if words.include? word
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
