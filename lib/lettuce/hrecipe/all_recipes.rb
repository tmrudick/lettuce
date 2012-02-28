module Lettuce
  class AllRecipes < Recipe

    class << self
      def can_parse?(doc, url)
        URI(url).host == "allrecipes.com"
      end
    end
    
    root '.hRecipe'
  end
end