class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} | #{recipe.description}"
    end
  end

  def ask_for_name
    puts "What name?"
    return gets.chomp
  end

  def ask_for_description
    puts "What description?"
    return gets.chomp
  end

  def ask_for(something)
    puts "What #{something}?"
    return gets.chomp
  end
end
