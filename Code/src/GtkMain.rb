begin
  require 'rubygems'
 rescue LoadError
end
require 'gtk3'
load "Jeu.rb"
load "GtkMenuPrincipal.rb"

class Main

  def initialize(game)
    @jeu=game

    puts("Creation fenetre Main")

    Gtk.init

    #Création de la fenêtre
    @window = Gtk::Window.new("PiCross")
    #@window.set_size_request(300, 300)
    @window.resizable=FALSE
    @window.set_window_position(:center_always)

    @window.signal_connect('destroy') {onDestroy}

		grid = Gtk::Grid.new
		hb = Gtk::Box.new(:horizontal, 10)
		vb = Gtk::Box.new(:vertical, 20)

		#Label de bordure gauche
		hb.add(Gtk::Label.new(""))

		#Label de bordure haut
		vb.add(Gtk::Label.new("\n\n\n\n\n\n\n\n\n\n\n\n"))

    #Création de la boite d'entrée du pseudo dans un hBox
    hbPseudo = Gtk::Box.new(:horizontal, 6)
    hbPseudo.pack_start(Gtk::Label.new('Pseudo'), :expand => false, :fill => false, :padding => 6)
    nom = Gtk::Entry.new
    hbPseudo.add(nom, :expand => false, :fill => false)
		vb.add(hbPseudo)

    #Création du bouton pour confirmer notre Pseudo
    iButton = Gtk::Image.new(:file => "../images/boutons/jouer.png")
		@button = Gtk::EventBox.new.add(iButton)
    @button.signal_connect("button_press_event") do
      if(nom.text == "")
				dialogBox("Veuillez rentrer un pseudo avant de jouer!")
    	else
        @jeu.pseudo = nom.text
        puts "Pseudo: " + @jeu.pseudo
        @window.hide
        MenuPrincipal.new(@jeu)
        onDestroy()
      end
    end
		vb.add(@button)

		hb.add(vb)

		#Label d'espacement
		hb.add(Gtk::Label.new(""))

    grid.attach(hb,0,0,1,1)

		#Wallpaper
		image = Gtk::Image.new(:file => "../images/wallpaper.jpg")
		grid.attach(image,0,0,1,1)

		@window.add(grid)

    @window.show_all

    Gtk.main

  end

	#Affiche une boite de dialogue avec un message
	def dialogBox( message )
		dialog = Gtk::Dialog.new("Alerte",
                             $main_application_window,
                             Gtk::Dialog::DESTROY_WITH_PARENT,
                             [ Gtk::Stock::OK, Gtk::Dialog::RESPONSE_NONE ])
		dialog.set_window_position(:center_always)

    # Ensure that the dialog box is destroyed when the user responds.
    dialog.signal_connect('response') { dialog.destroy }

    # Add the message in a label, and show everything we've added to the dialog.
    dialog.vbox.add(Gtk::Label.new( "\n" + message + "\n" ))
    dialog.show_all
	end

  ##
  # Callback de la fermeture de l'appli
  def onDestroy
    puts "Fin de l'application"
    #Quit 'propre'
    Gtk.main_quit
  end

end

Main.new( Jeu.new )
