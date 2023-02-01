# Show : cette classe sera une sorte de view. Elle affichera l'état du plateau de jeu à un instant T.
require 'pry'
require_relative 'game'
require_relative 'application'
require_relative 'board'

class Show

  #plateau initial
  def initial_board 
    puts "\n"
    puts "  BIENVENUE DANS CE JEU DU MORPION AMELIORE EN MODE ANNEE 1920"
    puts "     CHOISIS UNE CASE POUR Y METTRE TON SYMBOLE"
    puts " MAIS RENSEIGNE TON NOM "
    puts "        EN PREMIER"
    puts "\n"
    puts "   | _A_ | _B_ | _C_ |"
    puts "   |     |     |     |"
    puts " 1 |     |     |     |"
    puts "   |     |     |     |"
    puts  "-"*22 
    puts "   |     |     |     |"
    puts " 2 |     |     |     |"
    puts "   |     |     |     |" 
    puts  "-"*22
    puts "   |     |     |     |"
    puts " 3 |     |     |     |"
    puts "   |     |     |     |"
    puts "-"*22
    puts ''
  end

  #plateau de jeu qui se met à jour
  def show_board(hash)
    puts "\n"
    puts "         MORPION"
    puts "\n"
    puts "   | _A_ | _B_ | _C_ |"
    puts "   |     |     |     |"
    puts " 1 |#{hash.values_at("A1")}|#{hash.values_at("B1")}|#{hash.values_at("C1")}|"
    puts "   |     |     |     |"
    puts  "-"*22 
    puts "   |     |     |     |"
    puts " 2 |#{hash.values_at("A2")}|#{hash.values_at("B2")}|#{hash.values_at("C2")}|"
    puts "   |     |     |     |" 
    puts  "-"*22
    puts "   |     |     |     |"
    puts " 3 |#{hash.values_at("A3")}|#{hash.values_at("B3")}|#{hash.values_at("C3")}|"
    puts "   |     |     |     |"
    puts "-"*22
    puts ''
  end
end
