require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'player'
#binding.pry

def perform
    puts "-------------------"
    puts "Initialisations :"
    p player1 = Player.new("Josiane")
    p player2 = Player.new("José")

    while player1.life_points > 0 && player2.life_points > 0
        puts "-------------------"
        puts "Voici l'état de chaque joueur :"
        player1.show_state
        player2.show_state
        puts "Passons à la phase d'attaque :"

        #Attaque du player 1
        player1.attacks(player2)
        break if 0 >= player2.life_points

        #Attaque du player 2
        player2.attacks(player1)
    end
    puts "-------------------"
end

perform