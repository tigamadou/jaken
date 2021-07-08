class Player
  def hand
    puts "Select a hand to play"
    puts ""
    while true
      options()      
      input_hand = gets.chomp
      if ["0","1","2"].include?(input_hand)         
        return input_hand.to_i
      else
        puts "Please select a number between 0, 1 and 2"
        puts ""
      end
      
    end
  end

  def options
    
    puts "****************"
    puts "* 0 * Goo *****"
    puts "* 1 * Choki *"
    puts "* 2 * Par ****"
    puts "****************"
  end
end

class Enemy
  def hand
    
    return rand(0..2)
  end
end

class Janken
  def pon (player_hand, enemy_hand)
    
    janken = ["Goo", "Choki", "Par"]
    
    puts "Your hand is #{janken[player_hand]}."
    puts "The opponent's hand is #{janken[enemy_hand]}."
    
    if player_hand === enemy_hand
      
      puts "This is a Draw"
      
    elsif ((player_hand - enemy_hand + 3) % 3) === 2
      puts "You win"      
    else
      puts "You lose."      
    end
  end
end

class GameStart
  def self.jankenpon
    
    player = Player.new
    
    enemy = Enemy.new
    
    janken = Janken.new
    
    next_game = true
    while next_game
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end

GameStart.jankenpon