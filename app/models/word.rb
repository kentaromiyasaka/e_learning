class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  
  validates :content,presence: true,length:{maximum: 25}
  validate :has_one_correct
  private
    def has_one_correct
      unless choices.collect { |choice| choice.is_correct? }.count(true) ==1
        errors.add(:choices,"shoudle have one correct answer")
      end
    end
    # 
end
