require 'spec_helper'

describe EarthquakesController do
  describe '#index' do
    it "renders successfully" do
      get :index

      response.should be_success
    end
  end
end
