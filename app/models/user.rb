# frozen_string_literal: true

class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: %i[google_oauth2 github]

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.from_google(email:, username:, uid:, avatar_url:)
    user = find_by(google_uid: uid)
    user = find_by(email: email) unless user.present?

    return user.update_attributes(email:, google_uid:, username:, avatar_url:) if user.present?
    return create_with(google_uid: uid, username:, avatar_url:).find_or_create_by!(email:) if user.nil?
  end

  def self.from_github(email:, username:, uid:, avatar_url:)
    user = find_by(github_uid: uid)
    user = find_by(email: email) unless user.present?

    return user.update_attributes(email:, github_uid:, username:, avatar_url:) if user.present?
    return create_with(github_uid: uid, username:, avatar_url:).find_or_create_by!(email:) if user.nil?
  end
end
