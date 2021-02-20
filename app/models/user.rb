class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         
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
  has_many :sns_credentials

  validates :name, presence: true

  validates :password, presence: true, length: { minimum: 6 },
                       format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: 'は半角英数字で入力してください' }

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
        name: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
