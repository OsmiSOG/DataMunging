##### Part Two: Soccer League Table #####

class SoccerLeague
  attr_accessor :data

  def initialize
    @fileSoccer = File.open('football.dat')
    @data = []
    getData
  end

  def getData
    dataLines = @fileSoccer.readlines
    dataLines.each do |i|
      @data << [i[1,19], i[43,2].to_i, i[50,2].to_i]
    end
  end

  def minGoalDifference
    comparador = (@data[2][1] - @data[2][2]).abs
    minDiffTeam = @data[2][0]
    @data.each do |i|
      if i[0].to_i != 0
        if (i[1]-i[2]).abs < comparador
          comparador = (i[1]-i[2]).abs
          minDiffTeam = [i[0],comparador]
        end
      end
    end
    minDiffTeam
  end
end

soccer = SoccerLeague.new
team = soccer.minGoalDifference
puts "Team: #{team[0]}, difference goals #{team[1]}"
