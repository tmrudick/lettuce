require "lettuce/version"
require 'lettuce/hrecipe/hrecipe'
require 'lettuce/recipe'
require 'lettuce/hrecipe/all_recipes'
require 'open-uri'
require 'nokogiri'

module Lettuce
  
  def self.parsers
    { :all_recipes => Lettuce::AllRecipes, 
      :hrecipe_generic => Lettuce::Recipe }
  end
  
  def self.parse(url)
    begin
      doc = get_document url
    
      recipe = nil
      for parser in parsers.values
        if parser.can_parse?(doc, url)
          recipe = parser.parse(doc, url)
          break
        end
       end
    
    recipe
    
    rescue
      nil
    end
  end
  
  def self.get_document(url)
    html = ''
    open url do |http|
      html = http.read
    end
    Nokogiri::HTML(html)
  end
end

