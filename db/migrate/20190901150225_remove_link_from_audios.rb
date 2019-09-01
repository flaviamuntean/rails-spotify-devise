class RemoveLinkFromAudios < ActiveRecord::Migration[5.2]
  def change
    remove_column :audios, :link, :string
  end
end
