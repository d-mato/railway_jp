RSpec.describe RailwayJp::Station do
  describe "#{described_class}.all" do
    it do
      expect(described_class.all).to be_a Array
    end
  end

  describe "#{described_class}.find" do
    let(:attributes) {
      {
        id: '1130224',
        name: '東京',
        line_id: '11302',
        prefecture_id: '13',
        postcode: '100-0005',
        address: '東京都千代田区丸の内一丁目9-1',
        longitude: '139.766103',
        latitude: '35.681391',
      }
    }

    context 'find record by integer-id' do
      it do
        record = described_class.find(1130224)
        expect(record).to have_attributes(attributes)
      end
    end

    context 'find record by string-id' do
      it do
        record = described_class.find('1130224')
        expect(record).to have_attributes(attributes)
      end
    end
  end

  describe '#line' do
    it do
      record = described_class.find('1130224')
      expect(record.line).to be_a RailwayJp::Line
    end
  end

  describe '#line_name' do
    it do
      record = described_class.find('1130224')
      expect(record.line_name).to eq 'JR山手線'
    end
  end

  describe 'equality' do
    it '==' do
      record1 = described_class.find('1130224')
      record2 = described_class.find('1130224')
      expect(record1 == record2).to be true
    end

    it 'uniq' do
      record1 = described_class.find('1130224')
      record2 = described_class.find('1130224')
      expect([record1, record2].uniq.size).to be 1
    end
  end
end
