class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :pday

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :pday_id, numericality: { other_than: 1 }

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
