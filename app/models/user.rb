class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :email, presence: true

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    create_with(uid: uid, username: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
