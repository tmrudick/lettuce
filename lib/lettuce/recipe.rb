require 'nokogiri'

module Lettuce
  class Recipe    
    class << self
      def can_parse?(doc, url)
        doc.css('.hrecipe').size > 0
      end
      
      def root(root)
        @root = root
      end
            
      def parse(doc, url)
        recipe_root = doc.css(@root)
        if recipe_root.size > 0
          self.new(recipe_root[0], url)
        end
      end
      
      def parse_all(doc, url)
        recipes = doc.css(@root)
        
        if recipes.size > 0
          recipes.collect { |recipe_root| self.new(recipe_root, url) }
        end
      end
    end
    
    root '.hrecipe'
    
    def initialize(recipe_root, url)
      @root = recipe_root
      @url = url
    end
    
    def title(selector = '.fn')
      @root.css(selector)[0].content.strip
    end
    
    def ingredients(selector = '.ingredient')
      @root.css(selector).collect { |ingredient| ingredient.content.strip }
    end
    
    def photo(selector = '.photo')
      @root.css(selector)[0]['src']
    end
    
    def yield(selector = '.yield')
      @root.css(selector)[0].content.strip
    end
    
    def instructions(selector = '.instructions')
      @root.css(selector)[0].content.strip
    end
    
    def duration(selector = '.duration')
      @root.css(selector).collect { |duration| duration.content.strip }
    end
    
    def summary(selector = '.summary')
      @root.css(selector).content.strip
    end
    
    def author(selector = '.author')
      @root.css(selector).collect { |author| author.content.strip }
    end
    
    def published(selector = '.published)')
      @root.css(selector)      
    end
    
    def nutrition(selector = '.nutrition')
      @root.css(selector).collect { |nutrition| nutrition.content.strip }
    end
    
    def tags(selector = '.tag')
      @root.css(selector).collect { |tag| tag.content.strip }
    end
  end
end