class WorkbookItem < ApplicationRecord
  belongs_to :workbook
  has_many :choose_quizzes, dependent: :destroy
  has_many :writing_quizzes, dependent: :destroy
  has_many :word_quizzes, dependent: :destroy
  has_many :memos, dependent: :destroy
  
  validates :quiz_type, presence: true
  validates :name, presence: true
  
  enum quiz_type: { マルバツ問題: 1, 記述問題: 2, 単語問題: 3, メモ: 4}
end
