class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    #Retourne un message comprenant le nombre de points de vie du joueur
    def show_state
        return puts "- #{@name} a #{@life_points} points de vie"
    end

    #Retourne le nombre de points de vie du joueur
    def gets_damage(points)
        return false unless points.is_a?(Integer)
        if points < 0
            @life_points = 0
        else
            @life_points -= points
        end
        puts "- le joueur '#{@name}' a été tué !" if (0 >= @life_points)
        return @life_points
    end

    #Retourne le nombre de points de vie du joueur "attaqué"
    def attacks(player)
        player_points = compute_damage()
        puts "- le joueur #{@name} attaque le joueur #{player.name}, il lui inflige #{player_points} points de dommages"
        player.gets_damage(player_points)
    end

    #Retourne un nombre de points de vie alléatoire
    def compute_damage
        return rand(1..6)
    end
end