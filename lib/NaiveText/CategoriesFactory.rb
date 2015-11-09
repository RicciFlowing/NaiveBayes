class CategoriesFactory
  def self.build(config)
    categories = []
    default = nil
    if config.is_a?(Array)
      puts "The format [{name: name_of_category, path: path_to_trainings_data}] is deprecated and will be removed in future versions. Use the following arguments instead: categories: [name: 'the name', examples:'An example']"
      config.each do |category_config|
        begin
          examples = ExamplesFactory.from_files(category_config[:path])
          group = ExamplesGroup.new(examples: examples)
          categories << Category.new(name: category_config[:name], examples: group )
        rescue
          puts "You haven't provided trainingsdata for the category" + category_config[:name]
          puts "This category was not created."
        end
      end
      Categories.new(categories: categories)


    else
      config[:categories].each do |category_config|
        begin
          group = ExamplesGroup.new(examples: category_config[:examples])
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
end
