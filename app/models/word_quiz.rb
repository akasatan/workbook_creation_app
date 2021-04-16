class WordQuiz < ApplicationRecord
  belongs_to :workbook_item
  has_many :word_quiz_items, dependent: :destroy
  
  validates :quiz, presence: true
end
