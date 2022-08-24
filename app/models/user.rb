class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  # :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
end
