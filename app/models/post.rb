class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :messages
  belongs_to_active_hash :category
  has_one_attached :image

  #validates :category, presence: true
  #カテゴリーの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 }
end
