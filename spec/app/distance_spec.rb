require File.expand_path('../../../app/distance.rb', __FILE__)

RSpec.describe Distance do
  # For this test an independent calculator from the NOAA was used:
  # https://www.nhc.noaa.gov/gccalc.shtml
  # http://edwilliams.org/gccalc.htm
  describe '.calculate' do
    context 'in case of valid args' do
      let!(:lat1) { 53.3419 }
      let!(:long1) { -6.2868 }

      let!(:lat2) { 53.3083 }
      let!(:long2) { -6.2239 }

      let!(:correct_distance) { 5.6 }

      before do
        @distance1 = Distance.new(
          Point.new(lat1, long1), Point.new(lat2, long2)
        ).calculate
      end

      specify 'should return a correct great circle distance' do
        expect(@distance1).to eql(correct_distance)
      end
    end
  end
end
