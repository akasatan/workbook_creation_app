class WordQuizItem < ApplicationRecord
  belongs_to :word_quiz
  
  validates :correct_word, presence: true
  validates :explanation, presence: true
end
