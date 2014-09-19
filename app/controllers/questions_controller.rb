class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(:created_at)
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.all
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
      render action: 'new', notice: 'Question is not valid.'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    permitted = params.require(:question).permit(:title, :body, :user_id)
    permitted["user_id"] = current_user.id
    permitted
  end
end
