RSpec.describe Customers::Create do
  describe '.call' do
    context 'in case of correct data' do
      let!(:point) do
        build(:point, latitude: '54.080556', longitude: '-6.361944')
      end

      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/single.txt', __FILE__)
        )

        @customers = Customers::Create.call
        @customer = @customers[0]
      end

      specify 'an array with customers should be returned' do
        expect(@customers.size).to eql(1)
        expect(@customer).not_to be_nil

        expect(@customer.id).to eql(23)
        expect(@customer.name).to eql('Eoin Gallagher')
        expect(@customer.location.latitude).to eql(point.latitude)
        expect(@customer.location.longitude).to eql(point.longitude)
      end
    end

    context 'in case of incorrect data' do
      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/empty.txt', __FILE__)
        )

        @customers = Customers::Create.call
      end

      specify 'an empty array should be returned' do
        expect(@customers.size).to eql(0)
      end
    end
  end
end
