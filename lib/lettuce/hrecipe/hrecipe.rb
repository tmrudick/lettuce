module Lettuce
  class HRecipe
    
    class << self
      def can_parse?(doc, url)
        doc.css('.hrecipe').size > 0
      end
    end
    
    attr_reader :url
    
    def initialize(doc, url)
      @root = get_recipe_root(doc)
      @url = url
    end
    
    def get_recipe_root(doc)
      doc.css('.hrecipe')
    end
    
    def title
      @root.css('.fn')[0].content.strip
    end
    
  end
end