class WorkbooksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def new
    @workbook = Workbook.new
  end
  
  def create
    @workbook = current_user.workbooks.new(workbook_params)
    if @workbook.save
      redirect_to new_workbook_workbook_item_path(@workbook)
    else
      render :new
    end
  end
  
  def show
    @workbook = Workbook.find(params[:id])
    @workbook_items = @workbook.workbook_items
  end
  
  def edit
    @workbook = Workbook.find(params[:id])
  end
  
  def update
    workbook = Workbook.find(params[:id])
    if workbook.update(workbook_params)
      redirect_to workbook_path(workbook)
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  private
  def workbook_params
    params.require(:workbook).permit(:name, :disclosure_range)
  end
end
