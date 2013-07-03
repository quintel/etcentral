require 'spec_helper'

describe "pages" do

  describe "show a marked-up file" do

    context 'when page exists' do

      it 'renders correctly for Dutch' do
        get 'units?locale=nl'
        expect(response).to be_success
        expect(response.body).to match /eenheden/i
      end

      it 'renders correctly for English' do
        get 'units?locale=en'
        expect(response).to be_success
        expect(response.body).to match /calculations/i
      end

      it 'renders correctly for default locale' do
        get 'units'
        expect(response).to be_success
      end

    end

    context 'when page does NOT exist' do

      it 'renders 404' do
        expect { get 'dennis_for_president' }.to raise_error
      end

    end

  end

end
