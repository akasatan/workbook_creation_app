class WritingQuizzesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :check]
  
  def new
    @quiz = WritingQuiz.new
    @workbook_item = WorkbookItem.find(params[:workbook_item_id])
  end
  
  def create
    @quiz = WritingQuiz.new(writing_quiz_params)
    if @quiz.save
      redirect_to workbook_item_writing_quizzes_path(@quiz.workbook_item)
    else
      @quiz = WritingQuiz.new
      @workbook_item = WorkbookItem.find(params[:workbook_item_id])
      @quizzes = @workbook_item.writing_quizzes
      @user = @workbook_item.workbook.user
      render :index
    end
  end
  
  def index
    @quiz = WritingQuiz.new
    @workbook_item = WorkbookItem.find(params[:workbook_item_id])
    @quizzes = @workbook_item.writing_quizzes.order(id: "DESC")
    @user = @workbook_item.workbook.user
  end
  
  def edit
    @quiz = WritingQuiz.find(params[:id])
    @workbook_item = @quiz.workbook_item
  end
  
  def update
    @quiz = WritingQuiz.find(params[:id])
    if @quiz.update(writing_quiz_params)
      redirect_to workbook_item_writing_quizzes_path(@quiz.workbook_item)
    else
      @quiz = WritingQuiz.find(params[:id])
      render :edit
    end
  end
  
  def destroy
    @quiz = WritingQuiz.find(params[:id])
    if @quiz.destroy
      redirect_to workbook_item_writing_quizzes_path(@quiz.workbook_item)
    else
      @quiz = WritingQuiz.new
      @workbook_item = WorkbookItem.find(params[:workbook_item_id])
      @quizzes = @workbook_item.writing_quizzes
      @user = @workbook_item.workbook.user
      render :index
    end
  end
  
  def check
    @quiz = WritingQuiz.find(params[:id])
  end
  
  private
  def writing_quiz_params
    params.require(:writing_quiz).permit(:workbook_item_id, :quiz, :correct_answer)
  end
end
