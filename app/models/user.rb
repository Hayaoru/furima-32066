class User < ApplicationRecord
  Password_eng_num = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  Password_zen = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  Password_kana = /\A[ァ-ヶー－]+\z/.freeze

  validates :password, presence: true,format: { with: Password_eng_num}
  validates :name, presence: true


    with_options presence: true,format: {with: Password_zen}do
    validates :last_name
    validates :first_name
  end

  with_options presence: true,format:{with: Password_kana}do
  validates :last_name_kana
  validates :first_name_kana
  end

  validates :birthday, presence: true
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          has_many :items
          has_many :buy_items
end