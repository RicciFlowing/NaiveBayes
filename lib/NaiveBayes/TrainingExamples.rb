class TrainingExamples
  def initialize(args)
    @path = args[:path] || 'training/'
    @positive_examples = ExamplesGroup.new(@path+'positive/')
    @negative_examples = ExamplesGroup.new(@path+'negative/')
  end

  def p_apriori(arg)
    case arg
    when 'I'
      return @positive_examples.word_count.to_f / (@positive_examples.word_count + @negative_examples.word_count)
    when '!I'
      return @negative_examples.word_count.to_f / (@positive_examples.word_count + @negative_examples.word_count)
    end
  end

  def p( word, klass)
    if klass=='I'
      probability = (@positive_examples.count(word).to_f / @positive_examples.word_count)
    else
      probability = (@negative_examples.count(word).to_f / @negative_examples.word_count)
    end

  end

  private



end
