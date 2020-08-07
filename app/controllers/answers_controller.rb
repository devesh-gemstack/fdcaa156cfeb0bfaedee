class AnswersController < ApplicationController
	def create
		user = current_user
		@ans = user.answers.new(answer_params)
			debugger
		if @ans.save
			redirect_to question_path(answer_params[:question_id])
		else
			redirect_to question_path(answer_params[:question_id])
		end
	end

	private
	def answer_params
		params.require(:answer).permit(:answer, :question_id)
	end
end
