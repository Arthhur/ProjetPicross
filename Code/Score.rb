class Score 

# Le score du joueur est sauvegardé dans un fichier où sont répertoriés le temps, le pseudo et la difficulté choisie par le joueur



 # 3 Variables d'instance : le temps, le pseudo, la difficulté
	@temps
	@pseudo
	@difficulte
	@nomFichier
	
	def initialize(temps, pseudo, difficulte) 
		@temps = temps
		@pseudo = pseudo
		@difficulte = difficulte
		@nomFichier = "Score.txt"
	end
	
	
	# Méthode qui permet de rentrer le score d'un joueur dans un fichier nommé "Score.txt"
	
	def rentrerScore()
		f = File.new(@nomFichier,"w")
		
		f.puts("#{@temps} " + "#{@pseudo} " + "#{@difficulte}")
		
		f.close()
		
	end
	
	def lireScore() 
		f = File.open(@nomFichier, "r")
		f.each_line do |line|
			print "#{line}"
		end
		
		f.close()
	end
	
end


score = Score.new(30,"Arthur", "facile") 
score.rentrerScore()
score.lireScore()

		