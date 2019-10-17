class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :words, through: :answers


  def next_word
    (category.words - words).first
    # categoryに紐づいている全てのwoedsを取得する
  end
end