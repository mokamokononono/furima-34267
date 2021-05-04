class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name, uniqueness: true
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
      validates :kanji_family_name
      validates :kanji_given_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      validates :katakana_family_name
      validates :katakana_given_name
    end
    validates :date_of_birth
  end
  validates :password,
            format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: 'is invalid. Input half-width number & characters.' }

  has_many :items, dependent: :destroy
  has_many :orders
end
