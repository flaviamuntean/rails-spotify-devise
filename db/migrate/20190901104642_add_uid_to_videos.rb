class AddUidToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :uid, :string
  end
end
