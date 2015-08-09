require 'spec_helper'
require 'parser'

RSpec.describe Parser do
  describe  '#initialize' do
    let(:parser) { Parser.new('spec/samples/taxonomy.xml') }
    
    it 'should initialize and load a file' do
      expect(parser.document).to_not be_nil
    end
    
    it 'should get a list of 24 taxonomies' do
      expect(parser.document.xpath("//taxonomies//taxonomy//node").size).to be_eql(24)
    end
  end
  
  describe '#parse' do
    let(:parser) { Parser.new('spec/samples/destinations.xml') }
  end
end