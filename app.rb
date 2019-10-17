require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/board'
require_relative 'lib/box'
require_relative 'lib/player'
require_relative 'lib/game'

#Crée un Game
user_enthousiasm = true 
while user_enthousiasm do 
    #joue
    game = Game.new
    game.perform
    game.end

    #Demande à l'utilisateur s'il veut rejouer
    puts "Do you want to play again ? [y/n]"
    input = gets.chomp
    if input == "y"
        puts "If you're still enthousiast, then lets play again !"
        user_enthousiasm = true
    elsif input == "n"
        puts "OK, have a good day, Bro !"
        user_enthousiasm = false
    else 
        puts "I'll take this as a NO. Ciaooooo"
        user_enthousiasm = fasle

    end 
end 
