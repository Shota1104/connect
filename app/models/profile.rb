class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  
  with_options presence: true do 
    validates :name
    validates :explanation
    validates :image
    with_option :numericality :true do
      validates :insta_follower, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_man, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_woman, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age1, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age2, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age3, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age4, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age5, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age6, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age7, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_follower, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_man, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_woman, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_age1, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_age2, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_age3, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_age4, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_age5, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_age6, format: { with: /\A[0-9０-９]+\z/ }
      validates :youtube_age7, format: { with: /\A[0-9０-９]+\z/ }
      validates :viewing, format: { with: /\A[0-9０-９]+\z/ }
    end
    with_options  numericality: { other_than: 0 } do
      validates :category_id
    end
  end
end
