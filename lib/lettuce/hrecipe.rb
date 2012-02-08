require 'lettuce/hingredient'

class HRecipe

  attr_accessor :fn, :ingredients

  def initialize(doc, url)
    @ndoc = doc
    @url = url # May be eventually used for page wrapping
    @valid = true
    parse
  end
  
  def is_valid?
    @valid
  end
  
  # Parse photo
  def photo
    photo_element = @ndoc.css('.photo')
    
    return nil if photo_element.size == 0
    
    return photo_element[0]['src']
  end
  
  private
  def parse
    # Parse all required fields (fn, ingredients) and lazy load everything else
    
    # Parse name
    fn = @ndoc.css('.fn')
    if fn.size > 1 then
      @valid = false
      return
    end
    
    @fn = fn[0].content
    
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