require '../veh'
require 'minitest/autorun'

class VehTest < Minitest::Unit::TestCase
	def setup
		@veh = Vehicle.new(
			Vehicle::VehicleBuilder.new("car 1")
				.with_model("model car1")
		)
	end
	
	def test_attr1
		assert_equal @veh.model, "model car1"
	end
end