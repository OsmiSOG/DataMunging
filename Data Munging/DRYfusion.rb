class DryFusion

  def initialize path
    @file = File.open(path)
    @data = []
  end

  def difference
    comparador = (@data[2][1] - @data[2][2]).abs
    minDiff = [@data[2][0], comparador]
    @data.each do |i|
      if i[0].to_i != 0
        if (i[1]-i[2]).abs < comparador
          comparador = (i[1]-i[2]).abs
          minDiff = [i[0],comparador]
        end
      end
    end
    minDiff
  end

end

class WeatherData < DryFusion

  def initialize path
    super(path)
    getData
  end

  private
  def getData
    dataLines = @file.readlines
    dataLines.each do |i|
      @data << [i[1..3], i[4..9].to_f, i[10..15].to_f]
    end
  end
end

class SoccerLeague < DryFusion

  def initialize path
    super(path)
    getData
  end

  private
  def getData
    dataLines = @file.readlines
    dataLines.each do |i|
      @data << [i[1,19], i[43,2].to_i, i[50,2].to_i]
    end
  end
end

weather = WeatherData.new('weather.dat')
soccer = SoccerLeague.new('football.dat')

answerW = weather.difference
answerS = soccer.difference

puts "Dia: #{answerW[0]} , diferencia: #{answerW[1]} grados"
puts "Team: #{answerS[0]}, difference goals: #{answerS[1]}"
