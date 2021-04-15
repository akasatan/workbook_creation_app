class ChooseQuizzesController < ApplicationController
  
  def new
    @quiz = ChooseQuiz.new
    @item = WorkbookItem.find(params[:workbook_item_id])
  end
  
  def create
    @quiz = ChooseQuiz.new(choose_quiz_params)
    if @quiz.save
      redirect_to workbook_item_choose_quizzes_path(@quiz.workbook_item)
    else
      @quiz = ChooseQuiz.new
      @item = WorkbookItem.find(params[:workbook_item_id])
      @quizzes = @item.choose_quizzes
      render :index
    end
  end
  
  def index
    @item = WorkbookItem.find(params[:workbook_item_id])
    @quizzes = @item.choose_quizzes
    @quiz = ChooseQuiz.new
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def check
    @quiz = ChooseQuiz.find(params[:id])
  end
  
  private
  def choose_quiz_params
    params.require(:choose_quiz).permit(:workbook_item_id, :quiz, :judge, :explanation)
  end

end
