require 'spec_helper'
require 'html_creator'
require 'page'
RSpec.describe HtmlCreator do
  describe  '#initialize' do
    let(:creator) { HtmlCreator.new('spec/samples/output/sample.html', 'spec/samples/template_sample.html.erb') }
    
    it 'returns a instance of HtmlCreator' do
      expect(creator).to be_a HtmlCreator
    end
    
    it 'generate a html based in template and bindings' do
      page = Page.new('some title', 'some body')
      html = creator.result(page.bindings)
      expect(html).to include('<title>some title</title>')
    end
  end
end