require_relative "recipe"
require "nokogiri"
require "open-uri"

class Scraper
  def search(keyword)
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{keyword}"
    # 2. open the right url depending on keyword
    big_string = open(url).read
    doc = Nokogiri::HTML(big_string)

    results = []

    # 3. search the page with css class (m_contenu_resultat)
    doc.search(".m_contenu_resultat").first(5).each do |box|
      # and pick the relevent info from the box
      name = box.search(".m_titre_resultat").text.strip
      description = box.search(".m_detail_recette").text.strip
      results << Recipe.new(name, description)
    end

    return results
  end
end
