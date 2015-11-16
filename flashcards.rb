# card1 = 'cat|neko'
# card2 = 'dog|inu'

# card1 = {
#   "front" => "cat",
#   "back" => "neko"
# }
# card2 = {
#   "front" => "dog",
#   "back" => "inu"
# }

# In ruby, we usually use symbol. Use a symbol is faster than a string.
# The following code will be the same
# card1 = {
#   front: "cat", # :front => "cat "
#   back: "neko"
# }
# card2 = {
#   :front => "dog",
#   :back => "inu"
# }
module FlashCards
  class Application
    def initialize
      @decks = []
    end

    def <<(deck)
      @decks << deck
    end

    def play
      display_deck
      puts 'Pick a deck: '
      deck = get_deck
      deck.play
    end

    def display_deck
      @decks.each { |deck| puts deck.name }
    end

    def get_deck
      name = gets.chomp
      @decks.detect { |deck| deck.name == name }
    end
  end

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

    def correct?(guess)
      guess == @back
    end

    def play
      print "#{front} > "
      guess = gets.chomp
      if correct? guess
        puts 'Correct.'
      else
        puts "Incorrect, the answer is #{back}"
      end
    end
  end

  class Deck
    attr_reader :cards, :name
    def initialize(name)
      @name = name
      @cards = []
    end

    def <<(card)
      @cards << card
    end

    def shuffle
      @cards.shuffle! # equals @card = @card.shuffle
    end

    def play
      shuffle
      # puts "The #{name} is played."
      # @cards.each { |card| card.play }
      @cards.each(&:play)
    end
  end

  class MultileAnswerCard < Card
    def correct?(guess)
      answers = @back.split(',')
      answers.any? { |answer| answer == guess }
    end
  end
end

card1 = FlashCards::Card.new('cat', 'neko')
card2 = FlashCards::Card.new('dog', 'inu')
card3 = FlashCards::MultileAnswerCard.new('plane', 'air,space')
# deck = [card1, card2]
deck = FlashCards::Deck.new('deck1')
# deck.each do |card|
#  puts card
# end
# deck << card1
# deck << card2
deck << card3
app = FlashCards::Application.new
app << deck
app.play
# deck.cards.each do |card|
#   # card_parts = card.split('|') # Returns an array
#   # front = card_parts[0]
#   # back = card_parts[1]
#
#   # If you use the symbol, the following code(use string) is not valueable.
#   # front = card["front"]
#   # back = card["back"]
#
#   # front = card[:front]
#   # back = card[:back]
#
#   front = card.front
#   back = card.back
#
#   print "#{front} > "
#   guess = gets.chomp
#   if card.correct? guess
#     puts 'Correct.'
#   else
#     puts "Incorrect, the answer is #{back}"
#   end
# end
