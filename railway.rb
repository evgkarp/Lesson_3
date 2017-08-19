class Station

  attr_reader :name
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train
  end

  def trains_list
    @trains
  end

  def trains_types_list(type)
     @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)    
  end

end

class Route

  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
  end

  def add_station(station)
    @stations.insert(-2, station)    
  end

  def del_station(station)
    @stations.delete(station)    
  end

end

class Train

  attr_reader :number, :type, :wagon_count, :speed

  def initialize(number, type, wagon_count)
    @number = number
    @type = type
    @wagon_count = wagon_count    
    @speed = 0
    @station_index = 0
  end

  def speed_up(n)
    @speed += n
  end

  def current_speed
    @speed
  end

  def stop
    @speed = 0
  end

  def add_wagon
    @wagon_count += 1 if @speed == 0
  end

  def delete_wagon
    @wagon_count -= 1 if @speed == 0
  end

  def get_route=(route)
    @route = route
    @station_index = 0
  end

  def go_forward
    @station_index += 1  
  end

    def go_backward
    @station_index -= 1   
  end

  def current_station
    @route.stations[@station_index]    
  end

  def next_station
    @route.stations[@station_index + 1]   
  end
  
    def previous_station
    @route.stations[@station_index - 1]   
  end

end
