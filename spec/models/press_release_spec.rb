require 'spec_helper'

describe PressRelease do
  
  describe '#find' do
    
    let(:press_release) { PressRelease.all.first }
    
    it 'finds press release' do
      expect(press_release).to_not be_nil
    end
    
    it 'has a title and a link to a PDF file' do
      expect(press_release.title).to match /energietransitiemodel/i
      expect(press_release.link).to match /.pdf/
    end
    
  end
  
end