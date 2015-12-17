class WelcomeController < ApplicationController
	def index
		@show_name = "The O'Reilly Factor"
		@song_title = "The Barney Theme Song"
		@song_artist = "Wu Tang Clan"
	end
end
