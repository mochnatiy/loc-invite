RSpec.describe Customers::SelectNearest do
  describe '.call' do
    let!(:start_point) do
      build(:point, latitude: '53.339428', longitude: '-6.257664')
    end

    let!(:distance) { 100 }

    context 'in case of correct data' do
      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/correct.txt', __FILE__)
        )

        @customers = Customers::SelectNearest.call(
          start_point: start_point,
          distance: distance
        )
      end

      specify 'an array with nearest customers should be returned' do
        expect(@customers.size).to eql(2)
        expect(@customers.map(&:id)).to eql([23, 30])
        expect(@customers.map(&:name)).to eql(['Eoin Gallagher', 'Nick Enright'])
        expect(@customers.map(&:distance)).to eql([82.7, 82.6])
      end
    end

    context 'in case of incorrect data' do
      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/empty.txt', __FILE__)
        )

        @customers = Customers::SelectNearest.call(
          start_point: start_point,
          distance: distance
        )
      end

      specify 'an empty array should be returned' do
        expect(@customers.size).to eql(0)
      end
    end
  end
end
