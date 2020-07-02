require './main.rb'

subject = FlightRoutes.new([['SFO', 'COM'], ['COM', 'YYZ']]).call('COM')
puts "input: [['SFO', 'COM'], ['COM', 'YYZ']]"
puts "output: #{subject}"