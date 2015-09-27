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
    @propabilities[category.id] *= factor
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
