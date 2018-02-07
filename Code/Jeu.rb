##
# Classe Jeu abstraite qui peut lancer une partie sur une grille
# 4 Variables d'instances.
#

class Jeu

    @temps
    @difficulte
    @pseudo
    attr_accessor :pseudo,:difficulte,:taille

    private_class_method :new

    ##
    # Constructeur qui rappelle que l'on ne peut pas instancier cette classe
    #

    def Jeu.lancerJeu()
        new()
    end


    def initialize()
      @pseudo = setPseudo()
      @difficulte = setDifficulte()
      @taille = setTaille()
    end

    ##
    # Méthode qui permet de lancer le jeu
    #
    #

    ##
    # Méthode qui permet au joueur de rentrer son pseudo et le sauvegarder
    #
    def setPseudo()
      return "mehmet"
    end

    def setDifficulte()
        return 1
    end

    def setTaille()
      return 18
    end

end
