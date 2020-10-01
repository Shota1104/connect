class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name,                null:false
      t.integer :explanation,        null:false
      t.integer :insta_follower,     null:false
      t.integer :insta_gender,       null:false
      t.integer :insta_age,          null:false
      t.integer :youtube_follower,   null:false
      t.integer :youtube_gender,     null:false
      t.integer :youtube_age,        null:false
      t.integer :viewing,            null:false
      t.integer :category_id,        null:false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
