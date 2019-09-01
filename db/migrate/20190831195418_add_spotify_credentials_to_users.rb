class AddSpotifyCredentialsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :spotify_credentials, :string
  end
end
