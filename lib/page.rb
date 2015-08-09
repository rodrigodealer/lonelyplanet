require 'nokogiri'

class Page
  attr_accessor :title, :body 
  
  def initialize(title, body)
    @title = title
    @body = body
  end

  def bindings
    binding
  end  
end