require 'nokogiri'

class Parser
  @document = nil
  
  def initialize(filename)
    file = File.open(filename)
    @document = Nokogiri::XML(file)
    file.close
  end
  
  def document
    @document
  end
  
end