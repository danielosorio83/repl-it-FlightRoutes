class FlightRoutes
    def initialize(list)
      @list = list
      @response = []
    end

    def call(origin)
      sort_list_lexicographically
      process_list(@list.dup, origin)
      @response.size == @list.size + 1 ? @response : nil
    end

    private

    # sort the list in order alphabetically
    def sort_list_lexicographically
      @list.sort!{ |x1,x2| x1[0] <=> x2[0] && x1[1] <=> x2[1] }
    end

    # process the edge cases
    def process_list(list, origin)
      return if !list || list.empty?
      origin_points = list.map(&:first)
      index = origin_points.index(origin)
      return if !index || index < 0
      process_remaining_of_list_from_index(index, list)
    end

    # assign to responses and continue with the rest of the list
    def process_remaining_of_list_from_index(index, list)
      flight = list[index]
      @response << flight.first if @response.empty? # assign the first origin
      new_origin = flight.last
      @response << new_origin
      list.delete(flight) # remove from the list the already process flight
      process_list(list, new_origin)
    end
  end