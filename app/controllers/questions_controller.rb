class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @current_user = current_user
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
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

  def edit
    @question = Question.find(params[:id])
    @current_user = current_user
  end

  def update
    @current_user = current_user
    @question = Question.find(params[:id])
    @question.assign_attributes(question_params)
    if @question.save
      redirect_to question_path
    else
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).answers.each do |answer|
      answer.destroy
    end
    @question = Question.find(params[:id]).destroy
    redirect_to questions_path
  end

  def question_params
      params.require(:question).permit(:title, :description, :creator_id)
  end
end
