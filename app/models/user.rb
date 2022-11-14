class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :nickname, :birth_date, presence: true

  with_options presence: true, format: { with: VALID_ZENKAKU_REGEX } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: VALID_KATAKANA_REGEX } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :items
  has_many :orders
end
