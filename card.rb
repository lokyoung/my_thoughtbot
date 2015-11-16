class Card
  # attr_reader
  # attr_writer
  attr_accessor :front, :back
  # irb will throw a exception, the argument should be a symbol or a string
  # attr_accessor @front, @back
  def initialize(front, back)
    @front = front
    @back = back
  end

  # def front
  #   @front
  # end
end
