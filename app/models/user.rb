class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.name = auth.info.name
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
          end
        end

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :memos
  has_many :events


  # with_options presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: '全角カナを使用してください' } do
  #   validates :first_name_kana
  #   validates :last_name_kana
  # end

  validates :password, presence: true, length: { minimum: 6 },
            format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: 'は半角英数字で入力してください' }

  #   validates :password, presence: true, on: :create, allow_nil: true
end
