class QuestionsController < ApplicationController
  def index
  	@ques = Question.all
  end

  def new
  	@que = Question.new
  end

  def show
  	@que = Question.find(params[:id])
  	@answer = Answer.new
  	@answers = @que.answers
  end

  def create
  	user = current_user
  	@que = user.questions.new(question: que_params[:question], topic_id: params[:topic_id])
  	if @que.save
  		redirect_to question_path(@que)
  	else
  		render 'new'
  	end
  end

  private
  def que_params
  	params.require(:question).permit(:question)
  end


end
