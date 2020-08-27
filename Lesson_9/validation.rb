

class Game
  attr_accessor :gamers
  def initialize(player_name)
    @gamers = []
    @gamers << Dealer.new('Dealer')
    @gamers << Gamer.new(player_name)
    @result = []
    @winner = []
  end

  def new_game
    @gamers.each { |player| player.instance_variable_set(:@player_cards, {}) }
    @gamers.each { |player| 2.times {player.get_card} }
  end

  def report(number)
    puts ' '
    puts "#{@gamers[number].instance_variable_get(:@player_name)} cards are:"
    @gamers[number].instance_variable_get(:@player_cards).each_key do |key|
      print "#{"  " + key.to_s}"
    end
    puts
    puts "#{@gamers[number].instance_variable_get(:@player_name)} "\
    "count is #{@gamers[number].instance_variable_get(:@count)}"
    puts "#{@gamers[number].instance_variable_get(:@player_name)} "\
    "cash is #{@gamers[number].instance_variable_get(:@cash)}"
    puts ' '
  end

  def who_win
    @result = []
    @winner = []
    @gamers.each {|gamer| @result << gamer.cards_value}
    @result = @result.max
    @gamers.each {|gamer| @winner << gamer if @result == gamer.cards_value}
    if @winner.count == 2 
      p 'Its a draw'
    else
      p  "#{@winner[0].player_name} won"
    end  
  end  
end

class Gamer
  
  attr_accessor :player_name

  def initialize(player_name)
    @player_name = player_name
    @count = 0
    @cash = 100
    @player_cards = {}


    2.times {get_card}
    cards_value
  end

  def cards_value
    @count = @player_cards.values.sum
    @count
  end

  def get_card
    p cards_value
    card = Cards.new
    if card.instance_variable_get(:@count_card) == 11 && (cards_value + 11) > 21
      @player_cards[card.instance_variable_get(:@cartoon).to_sym] = 1
    else
      @player_cards[card.instance_variable_get(:@cartoon).to_sym] = card.instance_variable_get(:@count_card)
    end
    p cards_value
  end
end

class Dealer < Gamer

  def move
    if self.cards_value < 17
      get_card
    else 
      p 'skip_move'
      p self
    end
    p self
  end
end


class Cards
  COLOR = {1=> '+', 2=> '<3', 3=> '^', 4=> '<>'}
  CARTOONS =  {1=> 'J', 2=> 'Q', 3=> 'K'}

  def initialize
    @count_card = rand(2..11)
    if @count_card == 10
      case_ten = rand(0..1)
      if case_ten == 0
        @cartoon = "10#{COLOR[rand(1..4)]}"
      elsif case_ten == 1
        @cartoon = ("#{CARTOONS[rand(1..3)]}#{COLOR[rand(1..4)]}")
      end
    elsif @count_card == 11
      @cartoon = "A#{COLOR[rand(1..4)]}"
    else
      @cartoon = "#{@count_card}#{COLOR[rand(1..4)]}"
    end
  end
end

class Menu
  def initialize
    p "Please, enter your name"
    player_name = gets.chomp
    while player_name.empty?
      puts "Name can not be empty. Please, enter your name"
      player_name = gets.chomp
    end
    @game = Game.new(player_name)
    puts ''
    puts 'Dealer cards are: * *'
    @game.report 1
    player_menu
    p @game
  end

  def player_menu
    loop do
      puts %(
      Choose your action:
      1. Skip
      2. Take card
      3. Open
      0. Exit)
      action = gets.chomp
      case action.to_i
      when 1
        @game.gamers[0].move
      when 2
        @game.gamers[1].get_card
      when 3
        i = 0
        while i < 2
          @game.report(i)
          i += 1       
        end 
        @game.who_win 
        @game.new_game
      when 0
        break
      else
        p "Error: there are 4 actions avaliable, #{action} is out of range  "
      end  
    end   
  end 
end

ca=Menu.new
p ca
