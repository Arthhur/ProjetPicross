

class Score 

# Le score du joueur est sauvegardé dans un fichier où sont répertoriés le temps, le pseudo et la difficulté choisie par le joueur


 	# 3 Variables d'instance : le temps, le pseudo, la difficulté
	@temps
	@pseudo
	@difficulte
	@nomGrille
	@nomFichier
	
	def initialize(temps, pseudo, difficulte, nomGrille) 
		@temps = temps
		@pseudo = pseudo
		@difficulte = difficulte
		@nomGrille = nomGrille
		@nomFichier = "./Sauvegardes/Score.txt"
	end
	
	
	# Méthode qui permet de rentrer le score d'un joueur dans un fichier nommé "Score.txt"	
	def rentrerScore()

=begin
		f = File.new(@nomFichier,"w")


		f.puts("#{@temps} " + "#{@pseudo} " + "#{@difficulte}")

		f.close()
=end

		f = File.open(@nomFichier, "a+")
		f.puts("#{@temps} " + "#{@pseudo} " + "#{@difficulte} " + "#{@nomGrille}")
		f.close()
		
	end
	
	def lireScore() 

		f = File.open(@nomFichier, "r")
		f.each_line do |line|
			print "#{line}"
		end
		
		f.close()
	end


	##
	# Affiche le highscore d'une personne / grille
	#
	# Param : Le nom d'une grille ou d'un pseudo ou d'une difficulte
	# Retour : Ligne du tableau des scores correspondante
	def recupHS(unNom)

		tabScores = Array.new()

		# En remplie un tableau avec les scores du fichier
		f = File.open(@nomFichier, "r")
		f.each_line do |line|
			tabScores.push("#{line}")
			print "test : "+"#{line}"
		end		
		f.close()

		i=0
		# On garde que les lignes correspondants a la grille
		tabScores.each do |score|
			
			if !(score.include?(unNom))
				tabScores.delete(score)				
			end
			print "indice : "+i.to_s+"\n"
			i+=1
		end

		# On trie le tableau en fonction des score, on l'affiche et on le renvoie

		tabScoresBis = Array.new()
		for score in tabScores
			tabScoresBis.push(score.split(/ /))
		end
		tabScoresBis.sort_by(&:first)
		print "----- HIGHSCORE de "+unNom+": "+score+"\n"


		#tabScores.sort
		#print "----- HIGHSCORE de "+unNom+": "+tabScores[0]
		return tabScores[0]

	end

	##
	# Affiche les highscores d'une personne / grille
	#
	# Param : Le nom d'une grille ou d'un pseudo ou d'une difficulte
	# Retour : Tableau des scores correspondant
	def afficherHS(unNom)
		
		
		tabScores = Array.new()

		# En remplie un tableau avec les scores du fichier
		f = File.open(@nomFichier, "r")
		f.each_line do |line|
			tabScores.push("#{line}")
		end		
		f.close()

		# On garde que les lignes correspondants de la grille
		for score in tabScores
			if !(score.include?(unNom))
				tabScores.delete(score)
			end
		end
		
		
		# WORK IN PROGRESS
		tabScoresBis = Array.new()
		for score in tabScores
			tabScoresBis.push(score.split(/ /))
		end

		# On affiche les scores et on retourne le tableau
		print "----- HIGHSCORE(s) de "+unNom+" -----\n"
		for score in tabScoresBis.sort_by(&:first)
			print "- "+score[0]+" "+score[1]+" "+score[2]+"\n"
		end
		return tabScores

	end
	
end


	score = Score.new("30","Arthur", "facile", "Bateau") 
	score.rentrerScore()

	score = Score.new("50","Valentin", "HARD", "Cobra") 
	score.rentrerScore()

	score = Score.new("08","Valentin", "HARD", "Cobra") 
	score.rentrerScore()

	score = Score.new("12","Martin", "HARD", "Cobra") 
	score.rentrerScore()

	score = Score.new("6830","Benoit", "facile", "Test2x2") 
	score.rentrerScore()



	score.lireScore()

	score.recupHS("Valentin")
	score.afficherHS("Cobra")






		
