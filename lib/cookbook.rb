require 'csv'
require_relative "recipe"

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = [] # Array of `Recipe` instance
    load_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    write_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    write_csv
  end

  def find(index)
    @recipes[index]
  end

  def all
    return @recipes
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      boolean = row[2] == "true"
      @recipes << Recipe.new(row[0], row[1], boolean)
    end
  end

  def write_csv
    CSV.open(@csv_file, "w") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.done?]
      end
    end
  end
end






