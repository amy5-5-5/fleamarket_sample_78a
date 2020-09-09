class Item < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true

  # あとでアソシエーション記述する
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipping_date
end
