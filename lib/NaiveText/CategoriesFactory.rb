class CategoriesFactory
  def self.build(config)
    categories = []

    config.each do |category_config|
      begin
        examples = ExamplesGroup.new(category_config[:path])
        categories << Category.new(name: category_config[:name], examples: examples)
      rescue
        puts "You haven't provided trainingsdata for the category" + category_config[:name]
        puts "This category was not created."
      end
    end

    Categories.new(categories: categories)
  end
end
