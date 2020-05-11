RSpec.describe RailwayJp::Line do
  describe "#{described_class}.all" do
    it do
      expect(described_class.all).to be_a Array
    end
  end

  describe "#{described_class}.find" do
    let(:attributes) {
      {
        id: '11302',
        name: 'JR山手線',
      }
    }

    context 'find record by integer-id' do
      it do
        record = described_class.find(11302)
        expect(record).to have_attributes(attributes)
      end
    end

    context 'find record by string-id' do
      it do
        record = described_class.find('11302')
        expect(record).to have_attributes(attributes)
      end
    end
  end

  describe 'equality' do
    it '==' do
      record1 = described_class.find('11302')
      record2 = described_class.find('11302')
      expect(record1 == record2).to be true
    end

    it 'uniq' do
      record1 = described_class.find('1130224')
      record2 = described_class.find('1130224')
      expect([record1, record2].uniq.size).to be 1
    end
  end
end
