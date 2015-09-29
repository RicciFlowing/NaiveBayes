class CategoriesFactory
  def self.build(config)
    categories = []

    config.each do |category_config|
      examples = ExamplesGroup.new(category_config[:path])
      categories << Category.new(name: category_config[:name], examples: examples)
    end

    Categories.new(categories: categories)
  end
end
