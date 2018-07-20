class Recipe
  attr_reader :name, :description
  # DATA
  def initialize(name, description)
    @name = name
    @description = description
  end
end
