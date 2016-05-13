class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    if current_user != nil
      @question = Question.new
      @current_user = current_user
    else
      render :index
    end
  end

  def create
    @current_user = current_user
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def question_params
      params.require(:question).permit(:title, :description, :creator_id)
  end
end
