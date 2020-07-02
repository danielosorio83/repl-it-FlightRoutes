require './main.rb'

describe 'FlightRoutes' do

  subject { FlightRoutes.new(list).call(origin) }

  context 'given a flight list' do
    context 'scenario1' do
      let(:list){ [['SFO', 'HKO'], ['YYZ', 'SFO'], ['YUL', 'YYZ'], ['HKO', 'ORD']] }
      let(:origin){ 'YUL' }

      it 'returns the expected list' do
        expect(subject).to eq(['YUL', 'YYZ', 'SFO', 'HKO', 'ORD'])
      end
    end
    context 'scenario2' do
      let(:list){ [['A', 'C'], ['A', 'B'], ['B', 'C'], ['C', 'A']] }
      let(:origin){ 'A' }

      it 'returns the expected lexicographically smaller list' do
        expect(subject).to eq(['A', 'B', 'C', 'A', 'C'])
      end
    end
  end

  context 'when the list dont contains a valid scenario' do
    context 'when its origin point is not included in the list' do
      let(:list){ [['SFO', 'HKO'], ['YYZ', 'SFO'], ['YUL', 'YYZ'], ['HKO', 'ORD']] }
      let(:origin){ 'A' }

      it 'returns nil' do
        expect(subject).to eq(nil)
      end
    end

    context 'when it cant interact within all the list' do
      let(:list){ [['SFO', 'COM'], ['COM', 'YYZ']] }
      let(:origin){ 'COM' }

      it 'returns nil' do
        expect(subject).to eq(nil)
      end
    end
  end
end