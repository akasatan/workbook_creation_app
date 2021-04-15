class WorkbooksController < ApplicationController
  
  def new
    @workbook = Workbook.new
  end
  
  def create
    @workbook = current_user.workbooks.new(workbook_params)
    if @workbook.save
      redirect_to new_workbook_item_path
    else
      render :new
    end
  end
  
  def index

  end
  
  def show
    @workbook = Workbook.find(params[:id])
    @workbook_items = @workbook.workbook_items
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def workbook_params
    params.require(:workbook).permit(:name, :disclosure_range)
  end
end
