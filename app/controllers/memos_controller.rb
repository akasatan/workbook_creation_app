class MemosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :check]
  
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to workbook_item_memos_path(@memo.workbook_item)
    else
      @memo = Memo.new
      @workbook_item = WorkbookItem.find(params[:workbook_item_id])
      @memos = @workbook_item.memos
      @user = @workbook_item.workbook.user
      render :index
    end
  end
  
  def index
    @memo = Memo.new
    @workbook_item = WorkbookItem.find(params[:workbook_item_id])
    @memos = @workbook_item.memos.order(id: "DESC")
    @user = @workbook_item.workbook.user
  end
  
  def edit
    @memo = Memo.find(params[:id])
    @workbook_item = @memo.workbook_item
  end
  
  def update
    memo = Memo.find(params[:id])
    if memo.update(memo_params)
      redirect_to workbook_item_memos_path(memo.workbook_item)
    else
      @memo = Memo.find(params[:id])
      @workbook_item = @memo.workbook_item
      render :edit
    end
  end
  
  def destroy
    @memo = Memo.find(params[:id])
    if @memo.destroy
      redirect_to workbook_item_memos_path(@memo.workbook_item)
    else
      @memo = Memo.new
      @workbook_item = WorkbookItem.find(params[:workbook_item_id])
      @memos = @workbook_item.memos
      @user = @workbook_item.workbook.user
      render :index
    end
  end
  
  def check
    @memo = Memo.find(params[:id])
  end
  
  private
  def memo_params
    params.require(:memo).permit(:workbook_item_id, :text)
  end
end
