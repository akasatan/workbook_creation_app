class BookmarkItem < ApplicationRecord
  belongs_to :bookmark
  belongs_to :workbook
end
