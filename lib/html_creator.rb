require 'erb'
class HtmlCreator  
  def initialize(output_file, template_file)
    @output_file = output_file
    @template_file = template_file
  end
  
  def result(page)
    erb_file = File.read(@template_file)
    
    @renderer = ERB.new(erb_file)
    @renderer.result(page)
  end
  
  def write
    File.open(@output_file, 'w') do |f|
      f.write(result)
    end
  end
end