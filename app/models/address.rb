class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zipcode, :prefecture, :city, :street, presence: true
end
