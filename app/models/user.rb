class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :messages
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  
  with_options presence: true do
    validates :nickname, length: { maximum: 20 }
    validates :email, uniqueness: {case_sensitive: true}, format: { with: VALID_EMAIL_REGEX }
    validates :password, length: {minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }
  end

  def already_like?(post)
    self.likes.exists?(post_id: post.id)
  end
end
