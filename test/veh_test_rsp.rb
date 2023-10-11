require '../veh'
require 'minitest/autorun'

describe Vehicle do
	before do
		@veh = Vehicle.new(
			Vehicle::VehicleBuilder.new("Dodge charger")
				.with_engine("V8")
				.with_price(7.8*1e5)
		)
	end
	
	it "should have v8" do
		assert_equal @veh.engine, "V8"
	end
end


describe Vehicle do
	before do
		@veh = Vehicle.new(
			Vehicle::VehicleBuilder.new("Aventador")
				.with_engine("V12")
				.with_fuel_type("Pertalite")
				.with_price(5.07*1e6)
		)
	end

	it "should have proper engine and fuel" do
		assert_equal @veh.engine, "V12"
		assert_equal @veh.fuel_type, "Pertalite"
	end

	it "should have high value" do
		# assert @veh.price > 5.07*1e5, "Value is low"
		assert @veh.price < 5.07*1e5, "Value is high"
	end
end