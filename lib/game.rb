require 'pry'
class Game
    attr_accessor :board, :player1, :player2, :has_winner, :winner

    def initialize  
        #crée un joueur, lui demande son prénom et son symbole
        puts "\n ------------- FIRST PLAYER ------------- "
        @player1 = Player.new
        puts @player1.symbol_choice
        
        #crée le deuxième joueur et lui attribue l'autre symbole
        available_symbols = ["O","X"]
        available_symbols.delete(@player1.symbol)
        puts "\n ------------- SECOND PLAYER ------------- "
        @player2 = Player.new
        @player2.symbol = available_symbols[0]
        puts "#{@player2.name} you will play with the #{@player2.symbol} symbol"

        #affiche la grille initiale
        @board = Board.new
        puts "\n ------------- GAME----------------------- "
        puts "\nHere is the fabulous grid I've prepared for you !"
        @board.display
        @has_winner = false
    end

    #méthode qui scane les array historisant les cases cochées par les joueurs et regarde si ils contiennent 
    #une combinaison gagnante
    def winner?(player)
        winning_combinations = [
            ["A1","B1","C1"],
            ["A2","B2","C2"],
            ["A3","B3","C3"],
            ["A1","A2","A3"],
            ["B1","B2","B3"],
            ["C1","C2","C3"],
            ["A1","B2","C3"],
            ["A3","B2","C1"]
        ]
        result = false
        winning_combinations.each do |combi|
            result = combi.all? { |e| player.hit_box_array.include?(e) }
            break if result
        end
        return result
    end 

    def update_winner
        @has_winner = winner?(player1) || winner?(player2)
        if has_winner
            if winner?(player1)
                @winner = player1
                puts "\nCongrats #{player1.name} tu as gagné ! "
            else 
                @winner = player2
                puts "\nCongrats #{player2.name} tu as gagné ! "
            end 
        end 
    end 

    def perform
        #lancer des rounds de jeu jusqu'à ce que quelqu'un ait gagné ou qu'il n'y ait plus de case vide
        #(on avait déjà une variable available_box_names qu'on réutilise pour la 2eme condition)
        while @has_winner == false && board.available_boxes_names.size != 0

            #pour chaque round, on fait jouer successivement les deux joueurs
            [@player1,@player2].each do |player|
                #chaque joueur ne peut jouer que si le précédent n'a pas gagné ou complété la grille au sein du même tour
                if has_winner == false && board.available_boxes_names.size != 0

                    #on commence le tour du joueur par lui demander de choisir une case
                    box_name = player.box_choice(board.available_boxes_names)

                    #on cherche l'objet "box" (=case) qui correspond à l'entrée de l'utilisateur sur l'attribut name
                    box = board.content_array.find {|box| box.name == box_name}

                    #on edite le contenue de cette case avec le symbole du joueur
                    box.content = player.symbol

                    #on met à jour la liste des cases dispo et la variable has_winner
                    board.available_boxes_names.delete(box_name)
                    update_winner
                    
                    #on affiche la nouvelle grille après tour du joueur
                    board.display

                end           
            end
        end  
        #cas du match nul
        if has_winner == false && board.available_boxes_names.size == 0
            puts "Drow !"
        end
    end 

    def end 
        puts " ------------- FIN DU JEU ------------- "
    end 

end