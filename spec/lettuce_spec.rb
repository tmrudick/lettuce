require 'lettuce'
require 'open-uri'
require 'uri'

describe Lettuce do
  before(:all) do
    module OpenURI
      module OpenRead
        def open(*rest, &block)          
          case self.to_s
          when "http://www.foodnetwork.com/recipes/tyler-florence/roasted-asparagus-recipe/index.html"
            url = File.join(File.dirname(__FILE__), "fixtures/asparagus.html")
          when "http://allrecipes.com/Recipe/Pineapple-Sweet-Rolls/Detail.aspx"
            url = File.join(File.dirname(__FILE__), "fixtures/pineapple_rolls.html")
          else
            url = File.join(File.dirname(__FILE__), "fixtures/default.html")
          end

          open_uri_original_open(url, *rest, &block)
        end
      end
    end    
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
  
  it 'should return a recipe object called Pineapple Sweet Rolls' do
    recipe = Lettuce.parse("http://allrecipes.com/Recipe/Pineapple-Sweet-Rolls/Detail.aspx")
    
    recipe.title.should == "Pineapple Sweet Rolls"
  end
end