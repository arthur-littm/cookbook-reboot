require_relative "view"
require_relative "recipe"
require_relative "scraper"


class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @scraper = Scraper.new
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

  def import
    # 1.what keyord to search
    ingredient = @view.ask_for("keyword")
    results = @scraper.search(ingredient)

    # use the same method as `list`
    @view.display_recipes(results)

    index = @view.ask_for("index").to_i - 1

    # add the right result to the cookbook
    @cookbook.add_recipe(results[index])
  end


  def mark
    # 1. list again the recipes
    list
    # 2. ask an index to mark as done
    index = @view.ask_for("index").to_i - 1
    # 3. find which instance of recipe that index matches
    recipe = @cookbook.find(index)
    # 4. use the `mark_as_done!` method that instance
    recipe.mark_as_done!
    # 5. write the csv again
    @cookbook.write_csv
  end
end



















