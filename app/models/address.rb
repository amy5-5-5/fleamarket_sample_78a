class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip_code, :prefecture, :city, :street, presence: true
end
