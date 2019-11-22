class Lesson < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :category, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers
  # has_one :activity, as: :action, dependent: :destroy
  has_one :activity, as: :action, dependent: :destroy
  :dependent => "destroy"
  ["activity", "as" => "action" ,"dependent" => "destroy"]
  

  def next_word
    (category.words - words).first
    # categoryに紐づいている全てのwoedsを取得する
  end

  def correct_answers
    choices.where(is_correct: true).count
  end

end