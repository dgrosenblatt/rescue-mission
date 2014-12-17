class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    if @answer.save
      redirect_to @question, notice: "Answer submitted!"
    else
      @answers = @question.answers
      render 'questions/show'
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(answer_params)
      flash[:notice] = "Answer best-ed!"
    end
    redirect_to @question
  end

  private
  def answer_params
    params.require(:answer).permit(:description, :best)
  end
end
