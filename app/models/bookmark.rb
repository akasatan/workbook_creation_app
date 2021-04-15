class Bookmark < ApplicationRecord
  has_many :workbooks, through: :bookmark_items, dependent: :destroy
  has_many :bookmark_items
  
  validates :name, presence: true
end
