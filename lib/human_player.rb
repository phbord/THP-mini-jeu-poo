class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        super(life_points)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    #Retourne un message comprenant le nombre de points de vie du joueur
    def show_state
        return puts "#{super} et une arme de niveau \"#{@weapon_level}\""
    end

    #Retourne un nombre alléatoire de points de vie
    def compute_damage
        return rand(1..6)*@weapon_level
    end

    #Retourne son niveau d'arme augmenté
    def search_weapon
        player_points = compute_damage()
        puts "Tu as trouvé une arme de niveau #{player_points}"
        if player_points > @weapon_level
            @weapon_level = player_points
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
        return @weapon_level
    end

    #Retourne ses points de vie augmentés
    def search_health_pack
        points = compute_damage()
        if points == 1
            puts "Tu n'as rien trouvé... "
        elsif points == 6
            @life_points += 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        else
            @life_points += 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        end
        @life_points = 100 if @life_points > 100
        return @life_points
    end

    #Affiche du menu d'actions
    def display_action_menu(player1, player2)
        puts "\nQuelle action veux-tu effectuer ?"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "\nattaquer un joueur en vue :"
        print "0 "
        player1.show_state if player1.life_points > 0
        print "1 "
        player2.show_state if player2.life_points > 0
    end
end