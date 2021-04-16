class WorkbookItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def new
    @workbook_item = WorkbookItem.new
    @workbook = Workbook.find(params[:workbook_id])
  end
  
  def create
    @workbook_item = WorkbookItem.new(workbook_item_params)
    if @workbook_item.save
      case @workbook_item.quiz_type_before_type_cast
      when 1
        redirect_to workbook_item_choose_quizzes_path(@workbook_item)
      when 2
        redirect_to workbook_item_writing_quizzes_path(@workbook_item)
      when 3
        redirect_to word_quiz_items_path(@workbook_item)
      when 4
        redirect_to workbook_item_memos_path(@workbook_item)
      else
        render :new
      end
    else
      @workbook_item = WorkbookItem.new
      @workbook = Workbook.find(params[:workbook_id])
      render :new
    end
  end
  
  def show
    workbook_item = WorkbookItem.find(params[:id])
    case workbook_item.quiz_type_before_type_cast
      when 1
        redirect_to workbook_item_choose_quizzes_path(workbook_item)
      when 2
        redirect_to workbook_item_writing_quizzes_path(workbook_item)
      when 3
        redirect_to word_quiz_items_path(workbook_item)
      when 4
        redirect_to workbook_item_memos_path(workbook_item)
      else
        redirect_to workbook_path(workbook_item.workbook)
    end
  end
  
  def edit
    @workbook_item = WorkbookItem.find(params[:id])
    @workbook = @workbook_item.workbook
  end
  
  def update
    workbook_item = WorkbookItem.find(params[:id])
    if workbook_item.update(workbook_item_params)
      redirect_to workbook_path(workbook_item.workbook)
    else
      render :edit
    end
  end
  
  def destroy
    workbook_item = WorkbookItem.find(params[:id])
    if workbook_item.destroy
      redirect_to workbook_path(workbook_item.workbook)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def workbook_item_params
    params.require(:workbook_item).permit(:workbook_id, :quiz_type, :name)
  end
  
end
