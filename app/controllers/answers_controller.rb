class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to question_path(Question.find(@answer.question_id))
    else

      redirect_to question_path(Question.find(@answer.question_id)), notice: "Reply needs to be at least 50 characters"
    end
  end

  def answer_params
   params.require(:answer).permit(:question_id, :reply, :user_id)
  end
end
