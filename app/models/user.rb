class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: [:google_oauth2, :github]

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    create_with(google_uid: uid, username: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end

  def self.from_github(email:, username:, uid:, avatar_url:)
    user = find_by(github_uid: uid)

    if user.nil?
      return create_with(uid: uid, username: username, avatar_url: avatar_url).find_or_create_by!(email: email)
    end

    user
  end
end
