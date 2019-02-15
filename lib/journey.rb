require_relative 'station'
class Journey

  attr_reader :entrystation, :exitstation

  PUNISHMENT = 6
  MINFARE = 1

  def initialize(station = nil)
    @entrystation = station
  end

  def exit(station = nil)
    @exitstation = station
  end

  def fare
    return PUNISHMENT if @entrystation == nil || @exitstation == nil
    amount = @entrystation.zone - @exitstation.zone
    amount.abs + MINFARE
  end

end
