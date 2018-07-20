require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # pull all the recipes from cookbook
    recipes = @cookbook.all
    # send the array of recipes to the view
    @view.display_recipes(recipes)
  end

  def create
    # ask for a name and description
    name = @view.ask_for("name")
    description = @view.ask_for("description")
    # create an instance of Recipe
    recipe = Recipe.new(name, description)
    # add it to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    list
    index = @view.ask_for("index").to_i - 1
    @cookbook.remove_recipe(index)
  end
end



















