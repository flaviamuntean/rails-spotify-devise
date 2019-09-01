class CreateAudios < ActiveRecord::Migration[5.2]
  def change
    create_table :audios do |t|
      t.string :link
      t.string :uid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
