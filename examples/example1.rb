require './main.rb'

subject = FlightRoutes.new([['SFO', 'HKO'], ['YYZ', 'SFO'], ['YUL', 'YYZ'], ['HKO', 'ORD']]).call('YUL')
puts "input: [['SFO', 'HKO'], ['YYZ', 'SFO'], ['YUL', 'YYZ'], ['HKO', 'ORD']]"
puts "output: #{subject}"