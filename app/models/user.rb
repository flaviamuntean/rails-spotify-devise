class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:spotify]

  has_many :videos, dependent: :destroy
  has_many :audios, dependent: :destroy

  has_many :messages
  has_many :conversations, through: :messages, dependent: :destroy
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     # user.name = auth.info.name   # assuming the user model has a name
  #     # user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #     user.spotify_credentials = auth.to_hash
  #   end
  # end

  # def self.from_omniauth(auth)
  #   where(email: get_current_user.email).each do |user|
  #     # user.email = auth.info.email
  #     # user.password = Devise.friendly_token[0, 20]
  #     # user.name = auth.info.name   # assuming the user model has a name
  #     # user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #     user.spotify_credentials = auth.to_hash
  #     user.save
  #     return user
  #   end
  # end
end
