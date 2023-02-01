## Board : c'est le plateau. Il doit y avoir une instance de cette classe lors d'une partie.
# à l'initialisation du plateau, il doit instancier immédiatement 9 BoardCases (une par case).

# Variables d'instance : le Board doit embarquer les 9 BoardCase du jeu afin de pouvoir les lire et les modifier facilement. 
# Il faut les lui attribuer sous forme d'un array ou d'un hash. 
# Aussi, il est utile de compter le nombre de coup joué pour identifier facilement si on arrive au 9ème coup sans vainqueur.

# Méthodes : le Board va s'occuper de faire le lien entre les BoardCases et le Game : 
# il change les valeurs des BoardCases (de " " à "x" ou "o") 
# et vérifie en fonction de la combinaison des BoardCases si la partie est finie (= un joueur a gagné ou bien les 9 cases sont remplies sans vainqueur).

require_relative 'boardcase'
require_relative 'game'
require 'pry'

class Board
 attr_accessor :boardcases_hash, :turn_count, :victory_condition

 #On initialise la class Board
  def initialize
    @turn_count = 1
    @boardcases_hash = Hash.new #on créé un hash qui va contenir les 9 Boardcases
    @victory_condition = false #on initialise la variable d'instance pour les conditions de victoire
    boardcase = BoardCase.new #on initialise la classe BoardCase
    #on fait une boucle pour intégrer les valeurs de chaque case dans une hash
    for x in (0..8) do
      @boardcases_hash[boardcase.position[x]] = boardcase.value[0]
    end    
  end

  #méthode pour vérifier si le coup jouer par le joueur est possible, si oui , il place son symbole dans la value correspondante à la key
  def player_selection_hash(boardcases_hash,selection,player_sign)
    if boardcases_hash.has_key?(selection) == true && boardcases_hash[selection] == " "
      boardcases_hash[selection] = player_sign ##<= recuperer la valeur du sign des players
      puts "Nous sommes au tour numéro #{@turn_count +=1}"
    else
      puts "C'est pas bon, ouvre tes yeux"
    end
  end

  #méthode pour déterminer les 9 conditions de victoires possibles
  def victory?(boardcases_hash)
    case !@victory_condition
      when boardcases_hash['A1'] == boardcases_hash['A2'] && boardcases_hash['A1'] == boardcases_hash['A3'] && boardcases_hash['A3'] != " "
        puts "T'as tué ca mon gars."
      when boardcases_hash['B1'] == boardcases_hash['B2'] && boardcases_hash['B1'] == boardcases_hash['B3'] && boardcases_hash['B3'] != " "
        puts "Hey c'est bientot Bali mon gars"
      when boardcases_hash['C1'] == boardcases_hash['C2'] && boardcases_hash['C1'] == boardcases_hash['C3'] && boardcases_hash['C3'] != " "
        puts "Champion leagues"
      when boardcases_hash['A1'] == boardcases_hash['B1'] && boardcases_hash['A1'] == boardcases_hash['C1'] && boardcases_hash['C1'] != " "
        puts "Yeah babyyyy"
      when boardcases_hash['A2'] == boardcases_hash['B2'] && boardcases_hash['A2'] == boardcases_hash['C2'] && boardcases_hash['C2'] != " "
        puts "Tu sais que tu es le bienvenu dans la team HARVEY"
      when boardcases_hash['A3'] == boardcases_hash['B3'] && boardcases_hash['A3'] == boardcases_hash['C3'] && boardcases_hash['C3'] != " "
        puts "Le charisme de The Hacking Project"
      when boardcases_hash['A1'] == boardcases_hash['B2'] && boardcases_hash['A1'] == boardcases_hash['C3'] && boardcases_hash['C3'] != " "
        puts "propre on va peut être faire un morpion en mode 18 case"
      when boardcases_hash['A3'] == boardcases_hash['B2'] && boardcases_hash['A3'] == boardcases_hash['C1'] && boardcases_hash['C1'] != " "
        puts "Mais t'es trop fort"
    else
      puts "Aller on s'endort pas, on continue à jouer"
      false
  
    end
  end

end
#binding.pry