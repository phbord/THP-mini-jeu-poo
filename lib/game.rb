class Game < HumanPlayer
    attr_accessor :human_player, :enemies

    def initialize(name)
        super(life_points)
        @life_points = life_points
        @name = name
        @human_player = HumanPlayer.new("MOI")
        @enemies = []
        @players_left  = 10
        @enemies_in_sight = []
        generate_players()
    end

    #Génère les joueurs, les ajoute et instancie dans un tableau
    def generate_players(num=4)
        first_names = ['JCVD', 'chuck norris', 'stallone', 'steaven seagal', 'dolf lungren', 'jet li', 'tony jaa']
        num.times do |n|
            n = Player.new(first_names.sample)
            @enemies << n
        end
        return @enemies
    end

    #Supprime un joueur du tableau
    def kill_player(player)
        @enemies.delete(player)
    end

    #Retourne un condition pour savoir si l'utilisateur et les joueurs sont en vie
    def is_still_ongoing?
        return true if (@human_player.life_points > 0 && @enemies.length > 0)
        return false
    end

    #Affiche le nombre de joueurs
    def show_players
        @human_player.show_state
        puts "Le nombre de joueurs restant est #{@enemies.length}"
    end

    #Affiche un menu
    def menu
        puts "\nQuelle action veux-tu effectuer ?"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "\nattaquer un joueur en vue :"
        @enemies.each.with_index do |enemy,i|
            print "#{i} "
            enemy.show_state if enemy.life_points > 0
        end
    end

    #Lance des actions selon le caractère saisi
    def menu_choice(key)
        if key == "a"
            @human_player.search_weapon
        elsif key == "s"
            @human_player.search_health_pack
        else
            key = key.to_i
            @enemies.each.with_index do |enemy,i|
                @human_player.attacks(enemy) if (key == i && enemy.life_points > 0)
                kill_player(enemy) if (key == i && enemy.life_points <= 0)
            end
        end
    end

    #Attaques de chaque joueur contre l'utilisateur
    def enemies_attack
        @enemies.each do |enemy|
            enemy.attacks(@human_player) if (enemy.life_points > 0)
        end
    end

    #Affiche le résultat du jeu
    def end
        puts "Le jeu est fini"
        if @human_player.life_points > 0
            puts "BRAVO ! TU AS GAGNE !"
        else
            puts "Loser ! Tu as perdu !"
        end
    end
end
