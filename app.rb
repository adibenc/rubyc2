require 'sinatra'
require 'json'

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

get '/' do
	content_type :json
	
	{ msg: 'hello aa bb', result: [] }.to_json
  end