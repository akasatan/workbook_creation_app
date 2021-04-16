class Memo < ApplicationRecord
  belongs_to :workbook_item
  
  validates :text, presence: true
end
