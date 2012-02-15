require "lettuce/version"
require 'lettuce/hrecipe'
require 'open-uri'
require 'nokogiri'

module Lettuce
  
  def self.parse(url)
    begin
      doc = get_document url
    rescue
      return nil
    end
    
    if Lettuce::HRecipe.can_parse?(doc, url)
      Lettuce::HRecipe.new(doc, url)
    end
  end
  
  def self.get_document(url)
    html = ''
    open url do |http|
      html = http.read
    end
    Nokogiri::HTML(html)
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

