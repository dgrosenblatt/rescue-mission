class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(best: :desc)
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to :new_question, notice: 'New question submitted!'
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to @question, notice: "Question updated!"
    else
      render :edit
    end

  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to :questions, notice: "Question and all associated answers deleted!"
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end

  def answer_params
    params.require(:answer).permit(:description)
  end
end
