class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to question_path(@question), notice: 'Answer was successfully created.'
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
