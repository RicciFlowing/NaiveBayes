class Category
  attr_reader :examples
  attr_accessor :name

  def initialize(args)
    @name = args[:name]
    @examples = args[:examples]
  end
end
