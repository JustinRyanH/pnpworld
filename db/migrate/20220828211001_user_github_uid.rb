class UserGithubUid < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.rename :uid, :google_uid
      t.string :github_uid, null: true, unique: true
    end

    add_index :users, :google_uid, unique: true
  end
end
