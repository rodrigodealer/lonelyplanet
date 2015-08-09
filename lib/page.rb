require 'nokogiri'

class Page
  attr_accessor :title, :body, :children, :parent 
  
  def initialize(title, body, children, parent)
    @title = title
    @body = body
    @children = children
    @parent = parent
  end

  def bindings
    binding
  end  
end