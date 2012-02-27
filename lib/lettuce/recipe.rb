require 'nokogiri'

module Lettuce
  class Recipe
    root :hrecipe
    
    def method_missing(method, *args, &block)
      puts method
    end
  end
end