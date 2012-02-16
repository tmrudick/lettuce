module Lettuce
  class AllRecipes < HRecipe

    class << self
      def can_parse?(doc, url)
        URI(url).host == "allrecipes.com"
      end
    end
    
    def get_recipe_root(doc)
      doc.css('.hRecipe')
    end

  end
end