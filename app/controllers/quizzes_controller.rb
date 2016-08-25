class QuizzesController < ApplicationController
	def show 
		@quizz = Quizz.all 
	end 
end
