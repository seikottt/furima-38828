class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_price
  belongs_to :prefecture
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image


  validates :item_name        , presence: true
  validates :explanation      , presence: true
  validates :category_id      , numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_price_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id    , numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_date_id , numericality: { other_than: 1 , message: "can't be blank"}
  validates :price            , presence: true, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9999999 }
  validates :user             , presence: true
end
