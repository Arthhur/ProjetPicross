load "Map.rb"

class IndiceMoyen 
	
	attr_reader :black
	attr_reader :row
	attr_reader :col
	
	def initialize
		@penalites = 30
		@map = Map.create("../grilles/Scenario/Bateau")
		@nbMax = 2
		@row = 0
		@col = 0
		#boolean verifie si la case de la grille resultat est noir ou blanche true = noir false = blanche
		@black
	end
	

	def IndiceMoyen.create
		new()
	end
	

	def envoyerIndice
		#aleatoire sur toutes les cases 
		#verifie si la case choisie n'est pas deja remplie sinon recommence(a optimiser)
		#on prend que les cases à l'etat 0
		x = TRUE
		while x == TRUE do
			@row = rand(@map.getRows)
			@col = rand(@map.getCols)
			if @map.accessAt(@row,@col).getColor == 0
				x = FALSE
				
				if @map.accessAtRes(@row,@col) == 1
					@black = TRUE
				
				else
					@black = FALSE
				end
			end
		end
		
		print "Case libre à la ligne #{@row}, colonne #{@col}\n"
			
	end

		
end

voila = IndiceMoyen.create
voila.envoyerIndice