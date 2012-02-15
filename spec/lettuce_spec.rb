require 'lettuce'

describe Lettuce do
  before do
    # Set up fixture stuff
  end

  it 'should return nil if no recipes are found' do
    Lettuce.parse("http://tomrudick.com").should == nil
  end
  
  it 'should return nil if it gets a bad url' do
    Lettuce.parse("this is not a URL I don't even").should == nil
  end  
  
  it 'should return a recipe object called Roasted Asparagus' do
    recipe = Lettuce.parse("http://www.foodnetwork.com/recipes/tyler-florence/roasted-asparagus-recipe/index.html")
    
    recipe.title.should == "Roasted Asparagus"
  end
end