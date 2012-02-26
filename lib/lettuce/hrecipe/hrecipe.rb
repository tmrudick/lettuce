module Lettuce
  class HRecipe
    
    class << self
      def can_parse?(doc, url)
        doc.css('.hrecipe').size > 0
      end
      
      def get_root(doc)
        doc.css('.hrecipe')
      end
      
      def parse(doc, url)
        root = get_root(doc)
        if root.size > 0
          self.new(root[0])
        else 
          nil
        end
      end
    end
    
    attr_reader :url, :title, :ingredients
    
    def initialize(root)
      @root = root
    end
    
    def title
      @root.css('.fn')[0].content.strip
    end
    
    def ingredients
      ingredients_list = []
      @root.css('.ingredient').each do |ingredient|
        ingredients_list << ingredient.content.strip
      end
      
      ingredients_list
    end
    
    def photo
      @root.css('.photo')[0]['src']
    end
  end
end