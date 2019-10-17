require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/board'
require_relative 'lib/box'
require_relative 'lib/player'
require_relative 'lib/game'

#Crée un Game
game = Game.new

#boucle qui simule les tours : 
#a chaque tour : 

    #demande au premier joueur sa case en lui listant les cases vides

    while game.has_winner == false && game.board.available_boxes_names.size != 0

        [game.player1,game.player2].each do |player|
            if game.has_winner == false && game.board.available_boxes_names.size != 0
                box_name = player.box_choice(game.board.available_boxes_names)
                box = game.board.content_array.find {|box| box.name == box_name}
                box.content = player.symbol
                game.board.available_boxes_names.delete(box_name)
                puts "available boxes : #{game.board.available_boxes_names}"
                game.board.display
                game.update_winner
            end           
        end
    end  

    if game.has_winner == false && game.board.available_boxes_names.size == 0
        puts "Drow !"
    end 
    #puts "Do you want to play again ?"
    

    #met son symbole dedans
    #ajoute le nom de cette case à son hit_box_array pour historiser son coup
    #player.play ---------------
    #affiche la grille
    #teste si le joueur a une des combi gagnantes
    #si ce n'est pas le cas,
        #si aucune case ne contient " ", stop
        #sinon continue, 
    #sinon fin de la partie
    
    #[same bloc pour le deuxième joueur]

#fin de la partie : affiche qui a gagné
#affiche la grille
#propose de rejouer
