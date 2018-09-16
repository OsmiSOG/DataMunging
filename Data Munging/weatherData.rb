###### Part One: Weather Data #######

class WeatherData
  attr_accessor :data

  def initialize
    @fileWeather = File.open('weather.dat')
    @data = []
    getData
  end

  private
  def getData
    dataLines = @fileWeather.readlines
    dataLines.each do |i|
      @data << [i[1..3], i[4..9].to_f, i[10..15].to_f]
    end
  end

  public
  def minTemperatureDifference
    difference = @data[2][1] - @data[2][2]
    minDiffDay = @data[2][0]
    @data.each do |i|
      if i[0].to_i != 0
        if i[1]-i[2] < difference
          difference = i[1]-i[2]
          minDiffDay = [i[0], difference]
        end
      end
    end
    minDiffDay
  end

end

ejemplo = WeatherData.new
day = ejemplo.minTemperatureDifference
puts "Dia: #{day[0]} , diferencia: #{day[1]} grados"
