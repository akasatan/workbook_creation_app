class ChooseQuiz < ApplicationRecord
  belongs_to :workbook_item
  
  validates :quiz, presence: true
  validates :judge, presence: true
  validates :explanation, presence: true

  enum judge: { 〇: 1, ×: 2 }
end
