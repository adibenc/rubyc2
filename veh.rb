require 'json'

class Vehicle
	attr_accessor :vehicle_type, :brand, :model, :color, :year, :engine, :transmission, :fuel_type, :price

	def initialize(builder)
		@vehicle_type = builder.vehicle_type
		@brand = builder.brand
		@model = builder.model
		@color = builder.color
		@year = builder.year
		@engine = builder.engine
		@transmission = builder.transmission
		@fuel_type = builder.fuel_type
		@price = builder.price
	end

=begin 
def to_s
	"Type: #{@vehicle_type}, Brand: #{@brand}, Model: #{@model}, Color: #{@color}, Year: #{@year}, Engine: #{@engine}, Transmission: #{@transmission}, Fuel: #{@fuel_type}"
end 
=end

	# The VehicleBuilder class is responsible for building a Vehicle instance.
	class VehicleBuilder
		attr_accessor :vehicle_type, :brand, :model, :color, :year, :engine, :transmission, :fuel_type, :price

		def initialize(vehicle_type)
			@vehicle_type = vehicle_type
		end

		def with_brand(brand)
			@brand = brand
			self
		end

		def with_model(model)
			@model = model
			self
		end

		def with_color(color)
			@color = color
			self
		end

		def with_year(year)
			@year = year
			self
		end

		def with_engine(engine)
			@engine = engine
			self
		end

		def with_transmission(transmission)
			@transmission = transmission
			self
		end

		def with_fuel_type(fuel_type)
			@fuel_type = fuel_type
			self
		end
		
		def with_price(price)
			@price = price
			self
		end

		def build
			Vehicle.new(self)
		end
	end
end

# Usage
=begin
builder = Vehicle::VehicleBuilder.new("Car")
car = builder
	.with_brand("Toyota")
	.with_model("Camry")
	.with_color("Blue")
	.with_year(2023)
	.with_engine("2.5L")
	.with_transmission("Automatic")
	.with_fuel_type("Gasoline")
	.build

puts car.to_json
# puts car.to_s
=end
