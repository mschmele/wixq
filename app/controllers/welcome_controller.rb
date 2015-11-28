class WelcomeController < ApplicationController
	def index
		@show_name = "Meme Show 2016"
		@song_title = "Down with the Sickness"
		@song_artist = "Disturbed"
	end
end
