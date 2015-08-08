require 'nokogiri'

class Parser
  def initialize(filename)
    file = File.open(filename)
    @document = Nokogiri::XML(file)
    file.close
  end
  
  def document
    @document
  end
  
  def to_taxonomies
  end  
end