class Item < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
  validates :condition, presence: true
  validates :burden, presence: true
  validates :area, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true
  validates :status, presence: true

  # あとでアソシエーション記述する
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end
