require 'spec_helper'

describe EarthquakeQuery do
  subject { EarthquakeQuery }

  before do
    2.times { create(:earthquake) }
  end

  describe '#all' do
    let!(:record) { create(:earthquake, datetime: Time.now) }

    it "returns all records if no params passed" do
      subject.new({}).all.count.should == 3
    end

    describe 'filters by date' do
      it 'returns records on specific date' do
        subject.new(on: record.datetime).all.should == [record]
      end

      it 'applies since filter' do
        date = record.datetime - 1
        subject.new(since: date).all.should == [record]
      end
    end

    it 'filters by magnitude' do
      record.update_attribute :magnitude, 5.6
      subject.new(over: 5).all.should == [record]
    end

    it 'filters by distance (within 5 miles)' do
      record.update_attributes lat: 36.6702, lon: -114.8870

      subject.new(near: '36.6702,-114.8870').all.should == [record]
    end
  end
end
