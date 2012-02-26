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
      
      def parse_all(doc, url)
        root = get_root(doc)
        root.collect { |node| self.new(node) }
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
      @root.css('.ingredient').collect { |ingredient| ingredient.content.strip }
    end
    
    def photo
      @root.css('.photo')[0]['src']
    end
    
    def yield
      @root.css('.yield')[0].content.strip
    end
    
    def instructions
      @root.css('.instructions')[0].content.strip
    end
    
    def duration
      @root.css('.duration').collect { |duration| duration.content.strip }
    end
    
    def summary
      @root.css('.summary').content.strip
    end
    
    def author
      @root.css('.author').collect { |author| author.content.strip }
    end
    
    def published
      @root.css('.published')      
    end
    
    def nutrition
      @root.css('.nutrition').collect { |nutrition| nutrition.content.strip }
    end
    
    def tags
      @root.css('.tag').collect { |tag| tag.content.strip }
    end
  end
end