class WritingQuiz < ApplicationRecord
  belongs_to :workbook_item
  
  validates :quiz, presence: true
  validates :correct_answer, presence: true
end
