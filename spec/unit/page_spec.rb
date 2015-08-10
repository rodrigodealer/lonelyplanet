require 'spec_helper'
require 'parser'

RSpec.describe Page do
  describe  '#initialize' do
    let(:page) { Page.new('some title', 'some body', [], [])}
    it 'creates an instance of Page' do
      expect(page).to be_a Page
    end
    
    it 'instance has a title' do
      expect(page.title).to be_eql('some title')
    end
    
    it 'instance has a body' do
      expect(page.body).to be_eql('some body')
    end
    
    it 'instance has children' do
      expect(page.children).to be_eql([])
    end
    
    it 'instance has parent' do
      expect(page.parents).to be_eql([])
    end
    
    it 'has bindings' do
      expect(page.bindings).to be_a Binding
    end
  end
end