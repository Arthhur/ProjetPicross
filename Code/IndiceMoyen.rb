load "Indice.rb"

class IndiceMoyen 

	attr_reader :black
	attr_reader :row
	attr_reader :cols

	def initialize
		@penalites = 30
		@map = Map.create("./grilles/Scenario/Bateau")
		@nbMax = 2
		@row = 0
		@cols = 0
		#boolean verifie si la case de la grille resultat est noir ou blanche true = noir false = blanche
		@black

	end

	#def IndiceMoyen.create
	#	new()
	#end

	def envoyerIndice
		#aleatoire sur toutes les cases 
		#verifie si la case choisie n'est pas deja remplie sinon recommence(a optimiser)
		#on prend que les cases à l'etat 0
		x = TRUE
		
		while x do
			@row = rand(@map.getRows)
			@cols = rand(@map.getCols)

			if @map.accessAt(@row,@cols).getColor == 0
				x = FALSE
				
				if @map.accessAtRes(@row,@cols) == 1
					@black = TRUE
				
				else
					@black = FALSE
				end
			end
		end
		#print"#{row}"
		return self			
	end
end

	map = Map.create("./grilles/Scenario/Bateau")
	map.display

	ind = IndiceMoyen.new
	print ind.envoyerIndice.black.to_s+"\n"+"ligne :"+ind.row.to_s+" colonne :"+ind.cols.to_s+"\n"










