class HomesController < ApplicationController
  def top
    @workbooks = Workbook.open_all
  end
end
