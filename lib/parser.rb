require 'nokogiri'

class Parser
  attr_acessor :document
  
  def initialize(filename)
    file = File.open(filename)
    @document = Nokogiri::XML(file)
    file.close
  end
  
  def to_taxonomies
  end  
end