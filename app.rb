require 'sinatra'
require 'json'
require 'sinatra/activerecord'
require 'dotenv/load' # Load environment variables from .env

require_relative 'veh.rb'

# Set the database URL using the environment variable
url = ENV['DATABASE_URL']
uri = URI.parse(URI.encode(url.strip))

puts uri

set :database, uri

# Define a model
class Tb1 < ActiveRecord::Base
	self.table_name = 'tb1'
end


# Calculator class to handle arithmetic operations
class Calculator
	def add(x, y)
		x + y
	end

	def subtract(x, y)
		x - y
	end

	def multiply(x, y)
		x * y
	end

	def divide(x, y)
		raise 'Division by zero is not allowed' if y == 0
		x / y
	end
end

calculator = Calculator.new

def stdJson(s, m, d = nil)
	{
		success: s,
		message: m,
		data: d,
	}
end

def success(m, d = nil)
	stdJson(true, m, d)
end

def failed(m, d = nil)
	stdJson(false, m, d)
end

# Define routes for each arithmetic operation

# Addition
get '/add/:x/:y' do
	content_type :json
	x = params[:x].to_f
	y = params[:y].to_f
	result = calculator.add(x, y)
	{ operation: 'addition', result: result }.to_json
end

# Subtraction
get '/subtract/:x/:y' do
	content_type :json
	x = params[:x].to_f
	y = params[:y].to_f
	result = calculator.subtract(x, y)
	{ operation: 'subtraction', result: result }.to_json
end

# Multiplication
get '/multiply/:x/:y' do
	content_type :json
	x = params[:x].to_f
	y = params[:y].to_f
	result = calculator.multiply(x, y)
	{ operation: 'multiplication', result: result }.to_json
end

# Division
get '/divide/:x/:y' do
	content_type :json
	x = params[:x].to_f
	y = params[:y].to_f
	begin
		result = calculator.divide(x, y)
		{ operation: 'division', result: result }.to_json
	rescue StandardError => e
		status 400
		{ error: e.message }.to_json
	end
end

get '/veh/car' do
	content_type :json
	
	begin
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

		# puts car.to_s

		# result = car
		# success("Ok", car.to_json).to_json
		success("Ok", JSON.dump(car)).to_json
		# { message: 'division', result: result }.to_json
	rescue StandardError => e
		status 400
		{ error: e.message }.to_json
	end
end

get '/json1' do
	content_type :json

	begin
		ruby_data = { "name" => "John", "age" => 30, "city" => "New York" }

		# Encoding (Serializing) Ruby Data to JSON
		json_string = JSON.dump(ruby_data)
		puts "JSON String:"
		puts json_string

		# Decoding (Deserializing) JSON to Ruby Data
		parsed_data = JSON.parse(json_string)
		puts "\nParsed Data:"
		puts parsed_data.inspect

		success("ok", [
			1,2,
			json_string,
			parsed_data,
		]).to_json
	rescue StandardError => e
		status 400
		failed(e.message , nil)
	end
end

get '/tb1' do
	content_type :json

	begin
		tb1 = Tb1.all

		success("ok", tb1 ).to_json
		# success("ok", tb1.to_json ).to_json
		# success("ok", [] ).to_json
		# success("ok", JSON.dump(tb1) ).to_json
		# tb1.to_json
	rescue StandardError => e
		status 400
		failed(e.message , nil)
	end
end

get '/' do
	content_type :json
	
	{ msg: 'hello aa bb', result: [] }.to_json
end