require 'dotenv'
require 'pry'
require 'rspec'
require 'rubocop'
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/human_player'
require_relative 'lib/game'
#binding.pry

def perform
    #INTRO
    puts "------------------------------------------------"
    puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "------------------------------------------------\n"
    puts "Quel est ton nom ?\n"
    print "> "
    human_player_name = gets.chomp.to_s.downcase

    #Initialisation du JEU
    my_game = Game.new("Wolverine")
    my_game.human_player.name = human_player_name

    #COMBAT
    while my_game.is_still_ongoing?
        #ETAT de l'UTILISATEUR
        puts "\nBOUCLE -----------------------------------------\n"
        my_game.human_player.show_state
        #MENU d'actions
        my_game.menu
        #Attaques de l'UTILISATEUR
        print "\n> "
        my_game.menu_choice(gets.chomp.to_s.downcase)
        #Attaques ENNEMIES
        my_game.enemies_attack
        #break
    end

    #FIN DU JEU
    puts "\nFIN --------------------------------------------\n"
    my_game.end
end

perform