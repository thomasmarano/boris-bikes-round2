require 'bike'

describe Bike do
  before(:each) do
    @bike = Bike.new
  end

  describe '#working?' do
    it { is_expected.to respond_to :working?}
  end

  describe "#report_broken" do
    it 'returns if a bike is broken' do
      @bike.report_broken
      expect(@bike.broken).to eq(true)
    end
  end
end
