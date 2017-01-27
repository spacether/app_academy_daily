class Card
  attr_reader :value, :face_up

  def initialize(value, face_up = false)
    @value = value
    @face_up = face_up
  end

  def display
    @face_up ? @value : '_'
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
    display
  end

  def to_s
    puts "Card value is #{@value}. Face_up = #{@face_up}."
  end

  def ==(other)
    @value == other.value
  end
end
