class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  before_save {email.downcase!}
  # REGEX = Regular expression
  # To validate correct email structure
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 
  validates :name,presence:true,length:{ maximum:50 }
  validates :email,presence:true,length:{ maximum:225 },
              format:{with:EMAIL_REGEX},
              uniqueness: {case_senmsitive: false }
  has_secure_password
  validates :password,length:{ minimum:6 },allow_nil: true
  validates :name, presence: true
  validates :email, presence: true

  mount_uploader :picture,PictureUploader

  has_many :active_relationships, class_name: "Relationship",
                                foreign_key: "follower_id",
                                dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :following,  through: :active_relationships, source: :followed
  has_many :followers,  through: :passive_relationships

  def follow(other_user)
  	following << other_user
  end
  def unfollow(other_user)
    active_relationships.find_by(followed: other_user).destroy
  end
  def following?(other_user)
    following.include?(other_user)
  end
  def relationship(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
end