require 'nokogiri'

class Page
  attr_accessor :title, :body, :children, :parents
  
  def initialize(title, body, children, parents)
    @title = title
    @body = body
    @children = children
    @parents = parents
  end

  def bindings
    binding
  end  
end