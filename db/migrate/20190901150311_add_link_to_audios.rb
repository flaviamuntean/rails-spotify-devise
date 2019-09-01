class AddLinkToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :link, :text
  end
end
