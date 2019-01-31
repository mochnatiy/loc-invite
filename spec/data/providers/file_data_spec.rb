RSpec.describe Providers::FileData do
  describe '.data' do
    context 'when data file is corrent' do
      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/correct.txt', __FILE__)
        )

        @result = Providers::FileData.new.data
      end

      specify 'an array with customer records should be returned' do
        expect(@result).to eql(
          [
            {
              latitude: "53.761389",
              user_id: 30,
              name: "Nick Enright",
              longitude: "-7.2875"
            },
            {
              latitude: "54.080556",
              user_id: 23,
              name: "Eoin Gallagher",
              longitude: "-6.361944"
            },
            {
              latitude: "52.833502",
              user_id: 25,
              name: "David Behan",
              longitude: "-8.522366"
            }
          ]
        )
      end
    end

    context 'when data file is invalid' do
      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/invalid.txt', __FILE__)
        )
      end

      specify 'an empty array should be returned' do
        expect{ Providers::FileData.new.data }.to raise_error(
          StandardError, 'Data in file are corrupted'
        )
      end
    end

    context 'when data file is empty' do
      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/empty.txt', __FILE__)
        )

        @result = Providers::FileData.new.data
      end

      specify 'an array with customer records should be returned' do
        expect(@result).to eql(
          []
        )
      end
    end

    context 'when data file does not exist' do
      before do
        allow(Providers::Path).to receive(:info).and_return(
          File.expand_path('../../../fixtures/another.txt', __FILE__)
        )
      end

      specify 'an array with customer records should be returned' do
        expect{ Providers::FileData.new.data }.to raise_error(
          StandardError, 'File with data does not exist'
        )
      end
    end
  end
end
