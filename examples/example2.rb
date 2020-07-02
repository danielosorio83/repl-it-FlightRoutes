require './main.rb'

subject = FlightRoutes.new([['A', 'C'], ['A', 'B'], ['B', 'C'], ['C', 'A']]).call('A')
puts "input: [['A', 'C'], ['A', 'B'], ['B', 'C'], ['C', 'A']]"
puts "output: #{subject}"