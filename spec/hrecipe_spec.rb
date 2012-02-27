require 'lettuce'

describe Lettuce::HRecipe do
  before(:all) do
   @file = open(File.join(File.dirname(__FILE__), "fixtures/asparagus.html"))
   @document = Nokogiri::HTML(@file)

   @url = "http://www.foodnetwork.com/recipes/tyler-florence/roasted-asparagus-recipe/index.html"
  end

  it 'should be able to parse this recipe' do
    Lettuce::HRecipe.can_parse?(@document, @url)
  end

  it 'should be called Roasted Asparagus' do
    recipe = Lettuce::HRecipe.new(@document, @url)
    
    recipe.title.should == "Roasted Asparagus"
  end

  it 'should return only 6 ingredients' do
    recipe = Lettuce::HRecipe.new(@document, @url)
    recipe.ingredients.size.should == 5    
  end
  
  it 'should have a valid photo url' do
    recipe = Lettuce::HRecipe.new(@document, @url)
    recipe.photo.should == "http://img.foodnetwork.com/FOOD/2009/01/13/vday_roastedasparagus4854_s4x3_med.jpg"
  end
end