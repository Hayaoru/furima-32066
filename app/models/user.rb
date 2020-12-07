class User < ApplicationRecord
  Password_eng_num = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  Password_zen = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  Password_kana = /\A[ァ-ヶー－]+\z/.freeze
  validates :password, presence: true,format: { with: Password_eng_num}
  validates :name, presence: true
  
  validates :last_name, presence: true,format: {with: Password_zen}
  validates :first_name, presence: true,format: {with: Password_zen}
  validates :last_name_kana, presence: true,format: {with: Password_kana}
  validates :first_name_kana, presence: true,format: {with: Password_kana}
  validates :birthday, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          has_many :items
          has_many :buy_items
end