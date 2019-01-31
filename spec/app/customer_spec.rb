RSpec.describe Customer do
  let!(:point) { build(:point) }
  let!(:id) { 555 }
  let!(:name) { 'John Smith' }

  context 'in case of all arguments is correct' do
    before do
      @customer = Customer.new(
        id: id,
        name: name,
        location: point
      )
    end

    specify 'new customer should be built after initialization' do
      expect(@customer.id).to eql(id)
      expect(@customer.name).to eql(name)
      expect(@customer.location).to eql(point)
      expect(@customer.distance).to be_nil
    end
  end

  context 'in case of incorrect' do
    context 'name' do
      specify 'exception should be throwed' do
        expect{
          Customer.new(
            id: 'asdasda',
            name: name,
            location: point
          )
        }.to raise_error(ArgumentError, 'Id should be present')
      end
    end

    context 'id' do
      specify 'exception should be throwed' do
        expect{
          Customer.new(
            id: id,
            name: '',
            location: point
          )
        }.to raise_error(ArgumentError, 'Name should not be blank')
      end
    end

    context 'location' do
      specify 'exception should be throwed' do
        expect{
          Customer.new(
            id: id,
            name: name,
            location: 'No location'
          )
        }.to raise_error(ArgumentError, 'Location should be present')
      end
    end
  end
end
