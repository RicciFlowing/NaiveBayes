class Category
  @@id_counter = 1

  attr_reader :name
  attr_reader :id

  def initialize(args)
    @name = args[:name]
    @examples = args[:examples]
    @id = @@id_counter
    @@id_counter += 1
  end

  def p(word)
    @examples.count(word).to_f / @examples.word_count
  end

  def word_count
    @examples.word_count
  end
end
