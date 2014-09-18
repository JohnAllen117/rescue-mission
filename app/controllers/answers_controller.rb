class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    binding.pry
    if @answer.save
      redirect_to root_path, notice: 'Answer was successfully created.'
    else
      render action: :new, notice: 'Answer no good'
    end
  end

  private

  # Never trust parameters from the  internet, only allow the white list through.
  def answer_params
    permitted = params.require(:answer).permit(:title, :body, :user_id)
    permitted["user_id"] = current_user.id
    permitted
  end
end
