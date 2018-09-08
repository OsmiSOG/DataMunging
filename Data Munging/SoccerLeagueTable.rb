class SoccerLeague

  def initialize
    @fileSoccer = File.open('football.dat')
    @data = []
  end

  def getData
    dataLines = @fileSoccer.readlines
    dataLines.each do |i|
      @data << [i[1,17].to_i, i[4..9].to_f, i[10..15].to_f]
    end
  end

end

puts '12. Middlesbrough'.length
