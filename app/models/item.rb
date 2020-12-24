class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :pday

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :prefecture_id
    validates :pday_id
  end

  with_options presence: true do
    validates :title
    validates :explanation
    validates :image
    validates :price
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: "半角数字のみで入力して下さい" }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }
end
