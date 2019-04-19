class Card
  attr_reader :is_face_down, :value

  @@cards = ("A".."Z").to_a.join("")

  def initialize(value)
    @value = @@cards[value]
    @is_face_down = true
  end

  def hide
    @is_face_down = true
  end

  def reveal
    @is_face_down = false
  end

  def to_s
    return @value unless @is_face_down
    return " "
  end

  def ==(other_card)
    self.value == other_card.value
  end
end