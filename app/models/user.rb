class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :kanji_family_name, presence: true
  validates :kanji_given_name, presence: true
  validates :katakana_family_name, presence: true
  validates :katakana_given_name, presence: true
  validates :date_of_birth, presence: true

  validates :nick_name, uniqueness: true
end
