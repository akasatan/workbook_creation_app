class WorkbookItemsController < ApplicationController
  
  def new
    @item = WorkbookItem.new
    @workbooks = Workbook.all
  end
  
  def create
    @item = WorkbookItem.new(workbook_item_params)
    if @item.save
      case @item.quiz_type_before_type_cast
      when 1
        redirect_to new_workbook_item_choose_quiz_path(@item)
      when 2
        redirect_to new_writing_quiz_path(@item)
      when 3
        redirect_to new_word_quiz_item_path(@item)
      when 4
        redirect_to new_memo_path(@item)
      else
        render :new
      end
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def workbook_item_params
    params.require(:workbook_item).permit(:workbook_id, :quiz_type, :name)
  end
  
end
