class User < ApplicationRecord
  Password_eng_num = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  Password_zen = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  Password_kana = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :name
    validates :birthday
    validates :password, format: { with: Password_eng_num }

    with_options format: { with: Password_zen } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: Password_kana } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buy_items
end
