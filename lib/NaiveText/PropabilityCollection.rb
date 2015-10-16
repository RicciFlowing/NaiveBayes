class PropabilityCollection
  def initialize(args)
    @categories  =  args[:categories] || []
    initialize_ids
    @propabilities = []
    initalize_propabilities(@ids)
  end

  def find(category)
    return @propabilities[category.id]
  end


  def set(args)
    category  = args[:category]
    value = args[:value]
   @propabilities[category.id] = value
  end

  def multiply(args)
    category = args[:category]
    factor = args[:factor]
    if category
      @propabilities[category.id] *= factor
    else
      @propabilities.map! {|el| el*factor}
    end
  end

  def max
    id = @propabilities.find_index(@propabilities.max)
    @categories.find {|category| category.id == id}
  end

  def sum
    @propabilities.reduce(:+)
  end

  def to_s
    result = ''
    @categories.each do |category|
      result << category.to_s
      result << ':'
      result << self.find(category).to_s
      result << '\n'
    end
    result
  end

  private
  def initialize_ids
    @ids =  @categories.map { |category| category.id }
  end

  def initalize_propabilities(ids)
    ids.max.times do
      @propabilities << 0
    end
  end



end
