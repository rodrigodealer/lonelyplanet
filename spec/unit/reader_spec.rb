require 'spec_helper'
require 'reader'

RSpec.describe Reader do
  let(:destinations_file) { "spec/samples/destinations.xml" }
  let(:taxonomies_file) { "spec/samples/taxonomy.xml" }
  let(:reader) { Reader.new(destinations_file, taxonomies_file) }
  describe  '#initialize' do    
    it 'has 24 destinations in document' do
      expect(reader.destinations_document.xpath("//destinations//destination").size).to be_eql(24)
    end
    
    it 'has 24 taxonomies in document' do
      expect(reader.taxonomies_document.xpath("//taxonomies//taxonomy//node").size).to be_eql(24)
    end
  end
  
  describe '#destinations' do
    it 'returns same content size in destinations and destinations_document' do
      expect(reader.destinations.size).to be_eql(reader.destinations_document.xpath("//destinations//destination").size)
    end
  end
  
  describe '#taxonomies' do
    it 'returns same content size in taxonomies and taxonomies_document' do
      expect(reader.taxonomies.size).to be_eql(reader.taxonomies_document.xpath("//taxonomies//taxonomy//node").size)
    end
  end
  
  describe '#process' do
    before do
      Dir["output/*.html"].each {|f| FileUtils.rm(f) }
    end

    after do
      Dir["output/*.html"].each {|f| FileUtils.rm(f) }
    end

    it 'should process the both xml and create 24 html files' do
      reader = Reader.new('spec/samples/destinations.xml', 'spec/samples/taxonomy.xml')
      reader.process

      expect(Dir["output/*.html"].size).to be_eql(24)
    end
  end
end