class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)\w{6,12}\z/

  validates :nickname, :family_name, :first_name, :family_name_furigana, :first_name_furigana, presence: true
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  has_one :address
  has_many :items, dependent: :destroy
  end


