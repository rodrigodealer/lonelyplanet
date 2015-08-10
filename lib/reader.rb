require File.join(File.dirname(__FILE__), "parser")
require File.join(File.dirname(__FILE__), "html_creator")
require File.join(File.dirname(__FILE__), "page")

class Reader
  attr_accessor :destinations_document
  attr_accessor :taxonomies_document
  
  def initialize(destinations_file, taxonomies_file)
    @destinations_document = Parser.new(destinations_file).document
    @taxonomies_document   = Parser.new(taxonomies_file).document
  end
  
  def destinations
    destinations_document.xpath('//destinations//destination')
  end
  
  def taxonomies
    taxonomies_document.xpath('//taxonomies//taxonomy//node')
  end
  
  def process
    destinations.each do |destination|
      title = destination["title"]
      body = destination.css('introductory introduction overview').text
      children = taxonomies_children_of(title).css('node_name').to_a.map{|child| "#{child.text}" } unless taxonomies_children_of(title).nil?
      parents = parents_of(taxonomies.at_xpath("node_name[text()='#{title}']").parent.parent.css('node_name').first, [])
      page = Page.new(title, body, children, parents)
      creator = HtmlCreator.new("output/#{title}.html", "spec/samples/destination.html.erb")
      creator.write(page.bindings)
    end
  end
    
  private
  def parents_of(title, parents)
    parents << title.text
    if title.parent.parent.at_xpath('node_name').nil?
      parents
    else
      parents_of(title.parent.parent.at_xpath('node_name'), parents)
    end
  end
  
  def taxonomies_children_of(title)
    taxonomies.at_xpath("node_name[text()='#{title}']").next_element
  end
end