RSpec.describe Customers::CalculateDistance do
  describe '.call' do
    context 'in case of correct data' do
      let!(:point) do
        build(:point, latitude: '54.080556', longitude: '-6.361944')
      end

      let!(:start_point) do
        build(:point, latitude: '53.339428', longitude: '-6.257664')
      end

      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/single.txt', __FILE__)
        )

        @customers = Customers::CalculateDistance.call(start_point: start_point)
        @customer = @customers[0]
      end

      specify 'an array with customers with distance should be returned' do
        expect(@customers.size).to eql(1)
        expect(@customer).not_to be_nil

        expect(@customer.id).to eql(23)
        expect(@customer.name).to eql('Eoin Gallagher')
        expect(@customer.location.latitude).to eql(point.latitude)
        expect(@customer.location.longitude).to eql(point.longitude)
        expect(@customer.distance).to eql(82.7)
      end
    end

    context 'in case of incorrect data' do
      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/empty.txt', __FILE__)
        )

        @customers = Customers::CalculateDistance.call
      end

      specify 'an empty array should be returned' do
        expect(@customers.size).to eql(0)
      end
    end
  end
end
