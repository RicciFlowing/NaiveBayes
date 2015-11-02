class ProbabilityCollection
  def initialize(args)
    @categories  =  args[:categories] || []
    initialize_ids
    @probabilities = []
    initalize_probabilities(@ids)
  end

  def find(category)
    return @probabilities[category.id]
  end


  def set(args)
    category  = args[:category]
    value = args[:value]
   @probabilities[category.id] = value
  end

  def multiply(args)
    category = args[:category]
    factor = args[:factor]
    if category
      @probabilities[category.id] *= factor
    else
      @probabilities.map! {|el| el*factor}
    end
  end

  def category_with_max
    if @probabilities.max > 0
      id = @probabilities.find_index(@probabilities.max)
      @categories.find {|category| category.id == id}
    else
      NullCategory.new
    end
  end

  def max
    @probabilities.max
  end

  def greater_then(value)
    @probabilities.map! do |p|
       if p > value
         p
       else
         0
       end
    end
  end

  def sum
    @probabilities.reduce(:+)
  end

  def to_s
    result = ''
    @categories.each do |category|
      result << category.to_s
      result << ':'
      result << self.find(category).to_s
      result << "\n"
    end
    result
  end

  private
  def initialize_ids
    @ids =  @categories.map { |category| category.id }
  end

  def initalize_probabilities(ids)
    ids.max.times do
      @probabilities << 0
    end
  end
end
