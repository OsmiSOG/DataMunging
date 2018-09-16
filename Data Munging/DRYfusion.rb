class DryFusion

  def initialize path
    @file = File.open(path)
    @data = []
  end

  def difference data = getData
    @data = data
    comparador = (@data[2][:columnA] - @data[2][:columnB]).abs
    minDiff = {name:@data[2][:name], diferencia:comparador}
    @data.each do |line|
      if line[:name].to_i != 0
        if (line[:columnA]-line[:columnB]).abs < comparador
          comparador = (line[:columnA]-line[:columnB]).abs
          minDiff = {name:line[:name], diferencia:comparador}
        end
      end
    end
    minDiff
  end

end


class WeatherData < DryFusion

  def initialize path
    super(path)
  end

  private
  def getData
    dataLines = @file.readlines
    lines = []
    dataLines.each do |i|
      lines << {name: i[1..3], columnA: i[4..9].to_f, columnB: i[10..15].to_f}
    end
    lines
  end

  public
  def difference
    super(getData)
  end
end

class SoccerLeague < DryFusion

  def initialize path
    super(path)
  end

  private
  def getData
    dataLines = @file.readlines
    lines = []
    dataLines.each do |i|
      lines << {name: i[1,19], columnA: i[43,2].to_i, columnB: i[50,2].to_i}
    end
    lines
  end

  public
  def difference
    super(getData)
  end
end

weather = WeatherData.new('weather.dat')
soccer = SoccerLeague.new('football.dat')

answerW = weather.difference
answerS = soccer.difference

puts "Dia: #{answerW[:name]} , diferencia: #{answerW[:diferencia]} grados"
puts "Team: #{answerS[:name]}, difference goals #{answerS[:diferencia]}"
