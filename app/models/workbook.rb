class Workbook < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, through: :bookmark_items, dependent: :destroy
  has_many :bookmark_items
  has_many :workbook_items, dependent: :destroy
  
  enum disclosure_range: { open: 1, limited: 2, secret: 3 }
  
  scope :open_all, -> {where(disclosure_range: :open)}
end
