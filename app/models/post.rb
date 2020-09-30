class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :messages
  belongs_to_active_hash :category
  has_one_attached :image
  has_many :likes, dependent: :destroy
  belongs_to :user

  def self.search(search)
    if search != ""
      Post.where('name LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  #validates :category, presence: true
  #カテゴリーの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 }

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id
    validates :price, numericality: {with: /\A[0-9]+\z/}
  end
end
