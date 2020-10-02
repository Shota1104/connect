class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name,                null:false
      t.integer :explanation,        null:false
      t.integer :insta_follower,     null:false
      t.integer :insta_man,          null:false
      t.integer :insta_woman,        null:false
      t.integer :insta_age1,         null:false
      t.integer :insta_age2,         null:false
      t.integer :insta_age3,         null:false
      t.integer :insta_age4,         null:false
      t.integer :insta_age5,         null:false
      t.integer :insta_age6,         null:false
      t.integer :insta_age7,         null:false
      t.integer :youtube_follower,   null:false
      t.integer :youtube_man,        null:false
      t.integer :youtube_woman,      null:false
      t.integer :youtube_age1,       null:false
      t.integer :youtube_age2,       null:false
      t.integer :youtube_age3,       null:false
      t.integer :youtube_age4,       null:false
      t.integer :youtube_age5,       null:false
      t.integer :youtube_age6,       null:false
      t.integer :youtube_age7,       null:false
      t.integer :viewing,            null:false
      t.integer :category_id,        null:false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end