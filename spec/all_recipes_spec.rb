require 'lettuce'

describe Lettuce::AllRecipes do
  before(:all) do
   @file = open(File.join(File.dirname(__FILE__), "fixtures/pineapple_rolls.html"))
   @document = Nokogiri::HTML(@file)

   @url = "http://allrecipes.com/Recipe/Pineapple-Sweet-Rolls/Detail.aspx"
  end

  it 'should be able to parse this recipe' do
    Lettuce::AllRecipes.can_parse?(@document, @url)
  end

  it 'should be called Pineapple Sweet Rolls' do
    recipe = Lettuce::AllRecipes.new(@document)
    
    recipe.title.should == "Pineapple Sweet Rolls"
  end

  it 'should return 15 ingredients' do
    recipe = Lettuce::AllRecipes.new(@document)
    recipe.ingredients.size.should == 15    
  end
  
  it 'should have a valid photo url' do
    recipe = Lettuce::AllRecipes.new(@document)
    recipe.photo.should == "http://images.media-allrecipes.com/site/allrecipes/area/community/userphoto/small/789751.jpg"
  end
end