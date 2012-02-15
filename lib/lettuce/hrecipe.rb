require 'lettuce/hingredient'

module Lettuce
  class HRecipe

    attr_accessor :title, :ingredients, :url

    def initialize(doc, url)
      @ndoc = doc
      @url = url # May be eventually used for page wrapping

      populate_recipe
    end

    def self.can_parse?(doc, url)
      doc.css('.hrecipe').size > 0
    end

    private
    def populate_recipe
      # Parse all required fields (fn, ingredients) and lazy load everything else

      # Parse name
      fn = @ndoc.css('.fn')
      if fn.size > 1 then
        @valid = false
        return
      end

      @title = fn[0].content

      # Parse ingredient list
      ingredients = @ndoc.css('.ingredient')
      if ingredients.size == 0 then
        @valid = false
        return
      end

      # TODO: Also parse type and value
      @ingredients = []
      ingredients.each do |i|
        ingredient = HIngredient.new

        ingredient.text = i.content
        @ingredients.push ingredient
      end
    end
  end
end