class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :memos
  has_many :events

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: '全角カナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :password, presence: true, length: { minimum: 6 },
            format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: 'は半角英数字で入力してください' }

    validates :nickname, presence: true, allow_blank: true, on: :create

    validates :password, presence: true, on: :create, allow_nil: true
end
