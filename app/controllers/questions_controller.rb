class QuestionsController < ApplicationController
  before_action :authenticate, only: [:new, :create, :edit, :udpate, :destroy]

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
    @question.user_id = current_user.id
    if @question.save
      redirect_to @question, notice: 'New question submitted!'
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    if current_user.id != @question.user.id
      redirect_to @question, alert: 'Only the asker of this question can edit it!'
    end
  end

  def update
    @question = Question.find(params[:id])
    redirect_to root_path if current_user.id != @question.user.id
    if @question.update_attributes(question_params)
      redirect_to @question, notice: "Question updated!"
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if current_user.id != @question.user.id
      redirect_to @question, alert: 'Only the asker of this question can delete it!'
    end
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
