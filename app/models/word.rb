class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  
  validates :content,presence: true,length:{maximum: 25}
  validate :has_one_correct

  def correct_answer
    choices.find_by(is_correct: true)    
  # このメソッドは@wordモデルの中にあるので、使いたい時は@word = ~~と指定してあから
  # @word.correct_answer.contentで使用できる。
  end

  private
    def has_one_correct
      unless choices.collect { |choice| choice.is_correct? }.count(true) ==1
        errors.add(:choices,"shoudle have one correct answer")
      end
    end
end