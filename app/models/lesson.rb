class Lesson < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :category, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers


  def next_word
    (category.words - words).first
    # categoryに紐づいている全てのwoedsを取得する
  end
end