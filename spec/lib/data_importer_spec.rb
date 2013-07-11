require 'spec_helper'
require 'data_importer'

describe DataImporter do
  before do
    csv_data = File.read Rails.root.join('spec/fixtures/earthquakes.csv')
    subject.stub(:download_data).and_return csv_data
    subject.logger = nil
  end

  it "imports new records in database" do
    expect { subject.run }.to change { Earthquake.count }.by 3
  end

  it "doesn't import records twice" do
    subject.run
    expect {subject.run }.to_not change { Earthquake.count }
  end
end
