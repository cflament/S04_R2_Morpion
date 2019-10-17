class Player
    attr_accessor :name, :symbol, :hit_box_array

    # Initialization of the name of the two players
    def initialize
        puts "Enter the name of the player : "
        @name = gets.chomp
        @hit_box_array = []
    end
    
    # Player got to choose his symbol between "O" and "X"
    def symbol_choice
        puts "#{@name} you need to choose a symbol between O or X !"
        @symbol = gets.chomp.capitalize
        if !["O","X"].include?(@symbol)
            puts "You couldnt play without choosing between O or X, type your choice again please !"
        else 
            puts "#{@name} you choose the symbol #{@symbol}"
        end
    end

    # Player got to choose the box where he wants to add his symbol
    def box_choice(available_boxes_names)
        puts "\n#{@name}, your turn to chose the Box where you want to add #{@symbol} : "
        puts "the remaining boxes are : #{available_boxes_names}"
        hit = ""
        #récupération de l'input de l'utilisateur, en vérifiant que la case choisie est vide
        while !available_boxes_names.include?(hit)        
            hit = gets.chomp.capitalize
            if !available_boxes_names.include?(hit)
                puts "This box is not available, please choose an empty box"
            end 
        end
        #stockage du choix de l'utilisateur dans son hit box : 
        @hit_box_array << hit
        return hit 
    end 


end 



