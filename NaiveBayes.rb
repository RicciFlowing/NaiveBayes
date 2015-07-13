class TextClassifier
  def initialize()
    @examples = TrainingExamples.new
  end


  def classify(text)
    words = text.split(/\W+/)
    words = words.slice(0,100) # Use only the first 100 words for classification
    pIsInteristing = @examples.p_apriori("I")
    words.each_with_index do |word ,index|
      pIsInteristing *= @examples.p(index,word,"I")
    end
    pIsNotInteristing = @examples.p_apriori("!I")
    words.each_with_index do |word ,index|
      pIsNotInteristing *= @examples.p(index,word,"!I")
    end
    return [pIsInteristing, pIsNotInteristing ]
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

  def p(position, word, klass)
    if klass=='I'
      texts  =  @positive_texts
    else
      texts = @negative_texts
    end

    count = 0
    text_count = texts.length

    texts.each do |text|
           words = text.split(/\W+/)
          if words[position] == word
            count += 1
          end
    end
    probability = count.to_f / text_count
  end

  def print
    puts "Positiv:"
    puts @positive_texts
    puts "Negativ:"
    puts @negative_texts
  end

end

classifier = TextClassifier.new
puts classifier.classify("Blender ist eine freie, mit der GPL lizenzierte 3D-Grafiksoftware.");
