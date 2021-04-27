require 'dotenv'
require 'pry'
require 'rspec'
require 'rubocop'
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/human_player'
#binding.pry

def perform
    #INTRO
    puts "------------------------------------------------"
    puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "------------------------------------------------\n"

    #Initialisation de l'UTILISATEUR
    puts "Quel est ton nom ?\n"
    print "> "
    p user = HumanPlayer.new(gets.chomp.to_s)

    #Initialisation des ENNEMIES
    p player1 = Player.new("Josiane")
    p player2 = Player.new("José")
    enemies = [player1, player2]

    #COMBAT
    while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
        #ETAT de l'UTILISATEUR
        puts "\nBOUCLE -----------------------------------------\n"
        user.show_state
        #MENU d'actions
        user.display_action_menu(player1, player2)
        #Attaques de l'UTILISATEUR
        print "\n> "
        user_key = gets.chomp.to_s.downcase
        if user_key == "a"
            user.search_weapon
        elsif user_key == "s"
            user.search_health_pack
        elsif user_key == "0"
            user.attacks(player1)
        elsif user_key == "1"
            user.attacks(player2)
        end
        #Attaques ENNEMIES
        enemies.each do |enemy|
            enemy.attacks(user) if (enemy.life_points > 0)
        end
    end

    #FIN DU JEU
    puts "\nFIN --------------------------------------------\n"
    puts "La partie est finie"
    if user.life_points > 0
        puts "BRAVO ! TU AS GAGNE !"
    else
        puts "Loser ! Tu as perdu !"
    end
end

perform