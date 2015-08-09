require 'nokogiri'

class Parser
  attr_accessor :document
  
  def initialize(filename)
    file = File.open(filename)
    @document = Nokogiri::XML(file)
    file.close
  end
end