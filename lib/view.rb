class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      cross = recipe.done? ? "X" : " "
      puts "#{index + 1} [#{cross}] - #{recipe.name} | #{recipe.description}"
    end
  end

  def ask_for(something)
    puts "What #{something}?"
    return gets.chomp
  end
end
