require "lettuce/version"
require 'lettuce/hrecipe'
require 'open-uri'
require 'nokogiri'

module Lettuce
  
  def self.parse(url)
    nil
  end
  
  def self.parse_url(url)    
    begin
      doc = Nokogiri::HTML(open(url))
    rescue
      return []
    end
    
    results = []
    
    doc.css('.hrecipe').each do |hrecipe|
      recipe = HRecipe.new(hrecipe, url)
      results.push(recipe) if recipe.is_valid?
    end
    
    return results
  end
end

