class WeatherData
  attr_accessor :data

  def initialize
    @fileWeather = File.open('weather.dat')
    @data = []
  end

  def getData
    dataLines = @fileWeather.readlines
    dataLines.each do |i|
      @data << [i[1..3].to_i, i[4..9].to_f, i[10..15].to_f]
    end
  end

  def diferenciaTemperatura
    getData
    @data.each do |i|
      i << i[1]-i[2]
    end
    @data
  end


end

ejemplo = WeatherData.new
puts "#{ejemplo.diferenciaTemperatura}"
