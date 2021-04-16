class HomesController < ApplicationController
  def top
    @workbooks = Workbook.open_all.order(id: "DESC")
  end
end
