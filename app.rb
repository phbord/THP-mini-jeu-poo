require 'dotenv'
require 'pry'
require 'rspec'
require 'rubocop'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
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
        player2_points = player1.attacks(player2.name)
        player2.gets_damage(player2_points)
        break if 0 >= player2.life_points
        #Attaque du player 2
        player1_points = player2.attacks(player1.name)
        player1.gets_damage(player1_points)
    end
    puts "-------------------"
end

perform