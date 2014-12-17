class AnswersController < ApplicationController
  def create
    authenticate!
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to @question, notice: "Answer submitted!"
    else
      @answers = @question.answers
      render 'questions/show'
    end
  end

  def update
    authenticate!
    @question = Question.find(params[:question_id])
    if current_user.id != @question.user.id
      redirect_to @question, alert: 'Only the asker of this question can decide the best answer!'
    end
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(best: true)
      flash[:notice] = "Answer best-ed!"
    end
    redirect_to @question
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end
