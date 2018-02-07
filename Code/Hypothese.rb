load "Map.rb"

class Hypothese

# Ici une Hypothese c'est une grille à partir de laquelle on va faire des hypothèses et un tableau contenant une multitude de grilles hypothétiques. 
# On peut faire des hypothèses.
# On peut valider une hypothèse ou la rejeter.



 	# *VARIABLES D'INSTANCE*
	# * grillePrim : Grille originale 
	# * grillesHypothese : Grilles suite à l'entrée en hypothese(s) 

	
	##
	# Constructeur de la classe ( sujet à modifications )
	#
	def Hypothese.creer(uneGrille)
		new(uneGrille)
	end

	private_class_method:new

	def initialize(uneGrille)
		@grillePrim=uneGrille
		@grillesHypothese = Array.new()
	end
	


	##
	# Creer une hypothese
	#
	# Retour : grille sur laquelle le jeu va "travailler"
	def faireHypothese()

		if @grillesHypothese.empty?
			@grillesHypothese.push(@grillePrim)
		else	
			@grillesHypothese.push(@grillesHypothese.last)
		end

		return @grillesHypothese.last
	end


	##
	# Valide la derniere hypothese
	#
	def validerHypothese()
		tmp=@grillesHypothese.pop
		@grillesHypothese.pop
		@grillesHypothese.push(tmp)
		return @grillesHypothese.last
	end


	##
	# Rejete la derniere hypothese
	#
	def rejeterHypothese()
		@grillesHypothese.pop
		return @grillesHypothese.last
	end

	##
	# Retourne le nombre d'hypothses faites
	#
	def nbHypotheses()
		return @grillesHypothese.count
	end



end



		



		