require 'docking_station'
require 'bike'

describe DockingStation do
  before(:each) do
    @docking_station = DockingStation.new
  end

  describe '#release_bike' do

    it 'raises an error if docking station has no bike' do
      expect { @docking_station.release_bike }.to raise_error "Dock is empty!"
    end

    it 'responds to release bike' do
      expect(@docking_station).to respond_to(:release_bike)
    end

    it 'releases a working bike' do
      bike = Bike.new
      @docking_station.dock(bike)
      expect(bike).to be_working
    end

    it 'does not release broken bikes' do
      bike = Bike.new
      bike.report_broken
      second_bike = Bike.new
      @docking_station.dock(bike)
      @docking_station.dock(second_bike)
      expect(@docking_station.release_bike).to eq(second_bike)
    end

  end

  describe '#dock' do

    it 'responds to docking a bike' do
      expect(@docking_station).to respond_to(:dock).with(1).argument
    end

    it 'docks a bike' do
      bike = Bike.new
      @docking_station.dock(bike)
      expect(@docking_station.bikes).to include(bike)
    end

    it 'raises an error if docking station contains full capacity of bikes' do
      @docking_station.capacity.times { @docking_station.dock(Bike.new)}
      expect {@docking_station.dock(Bike.new)}.to raise_error "Dock is full!"
    end

  end

  describe '#bike' do
    it 'tells you if bike is docked' do
      bike = Bike.new
      @docking_station.dock(bike)
      expect(@docking_station.bikes).to include(bike)
    end
  end

  it 'automatically sets capacity to 20 if nothing is set' do
    expect(@docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'has a variable capacity' do
    station = DockingStation.new(30)
    30.times{station.dock(Bike.new)}
    expect{station.dock(Bike.new)}.to raise_error "Dock is full!"
  end


end
