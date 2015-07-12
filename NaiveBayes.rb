class TextClassifier
  def initialize(text)
    @text = text
  end

  def train(expamles)

  end

  def classify()
  end
end

class TrainingExamples
  def initialize()
    @positive = Array.new
    @negative = Array.new

    Dir.foreach('examples/positive/') do |example_file|
      next if example_file == '.' or example_file == '..'
        @positive << File.read('examples/positive/' + example_file)
      end

    Dir.foreach('examples/negative/') do |example_file|
      next if example_file == '.' or example_file == '..'
        @negative << File.read('examples/negative/' + example_file)
      end

  end

  def p(args)
  end

  def print
    puts "Positiv:"
    puts @positive
    puts "Negativ:"
    puts @negative
  end
end

exam = TrainingExamples.new
exam.print
