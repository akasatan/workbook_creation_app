class Workbook < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, through: :bookmark_items, dependent: :destroy
  has_many :bookmark_items
  has_many :workbook_items, dependent: :destroy
  
  validates :name, presence: true
  validates :disclosure_range, presence: true
  
  enum disclosure_range: { 全員に公開: 1, リンクを知っている人に公開: 2, 非公開: 3 }
  
  scope :open_all, -> {where(disclosure_range: :全員に公開)}
end
