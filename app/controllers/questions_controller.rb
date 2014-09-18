class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new

  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to '/', notice: 'Question was successfully created.'
    else
      render action: 'new', notice: 'Question no good'
    end
  end

  # GET /questions/search
  def search
    @questions = Question.search(params[:query])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    permitted = params.require(:question).permit(:title, :body, :user_id)
    permitted["user_id"] = current_user.id
    permitted
  end
end
