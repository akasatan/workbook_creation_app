class ChooseQuizzesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :check]
  
  def new
    @quiz = ChooseQuiz.new
    @workbook_item = WorkbookItem.find(params[:workbook_item_id])
  end
  
  def create
    @quiz = ChooseQuiz.new(choose_quiz_params)
    if @quiz.save
      redirect_to workbook_item_choose_quizzes_path(@quiz.workbook_item)
    else
      @quiz = ChooseQuiz.new
      @workbook_item = WorkbookItem.find(params[:workbook_item_id])
      @quizzes = @workbook_item.choose_quizzes
      @user = @workbook_item.workbook.user
      render :index
    end
  end
  
  def index
    @quiz = ChooseQuiz.new
    @workbook_item = WorkbookItem.find(params[:workbook_item_id])
    @quizzes = @workbook_item.choose_quizzes.order(id: "DESC")
    @user = @workbook_item.workbook.user
  end
  
  def edit
    @quiz = ChooseQuiz.find(params[:id])
    @workbook_item = @quiz.workbook_item
  end
  
  def update
    @quiz = ChooseQuiz.find(params[:id])
    if @quiz.update(choose_quiz_params)
      redirect_to workbook_item_Choose_quizzes_path(@quiz.workbook_item)
    else
      @quiz = ChooseQuiz.find(params[:id])
      render :edit
    end
  end
  
  def destroy
    @quiz = ChooseQuiz.find(params[:id])
    if @quiz.destroy
      redirect_to workbook_item_choose_quizzes_path(@quiz.workbook_item)
    else
      @quiz = ChooseQuiz.new
      @workbook_item = WorkbookItem.find(params[:workbook_item_id])
      @quizzes = @workbook_item.choose_quizzes
      @user = @workbook_item.workbook.user
      render :index
    end
  end
  
  def check
    @quiz = ChooseQuiz.find(params[:id])
  end
  
  private
  def choose_quiz_params
    params.require(:choose_quiz).permit(:workbook_item_id, :quiz, :judge, :explanation)
  end

end
