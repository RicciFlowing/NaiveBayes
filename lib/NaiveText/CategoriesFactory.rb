class CategoriesFactory
  def self.build(config)
    categories = []
    default = nil
    config[:categories].each do |category_config|
      begin
        group = ExamplesGroup.new(examples: category_config[:examples], language_model: config[:language_model] )
        category = Category.new(name: category_config[:name], examples: group, weight: category_config[:weight])
        categories << category
        if category_config[:name] == config[:default]
          default = category
        end
      rescue
        puts "You haven't provided trainingsdata for the category" + category_config[:name]
        puts "This category was not created."
      end
    end
    Categories.new(categories: categories, default: default )
  end
end
