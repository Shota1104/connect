class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options numericality: { allow_blank: true, only_integer: true } do
    validates :youtube_follower, allow_blank: true, format: { with: /\A[0-9０-９]{5,}\z/ }
    validates :youtube_man
    validates :youtube_woman
    validates :youtube_age1
    validates :youtube_age2
    validates :youtube_age3
    validates :youtube_age4
    validates :youtube_age5
    validates :youtube_age6
    validates :youtube_age7
    validates :viewing
    validates :audience
    validates :youtube_impression
    validates :twitter_follower, allow_blank: true, format: { with: /\A[0-9０-９]{4,}\z/ }
    validates :twitter_man
    validates :twitter_woman
    validates :twitter_age1
    validates :twitter_age2
    validates :twitter_age3
    validates :twitter_age4
    validates :twitter_age5
    validates :twitter_age6
    validates :twitter_age7
    validates :twitter_impression
    validates :twitter_engagement
    validates :user_id, uniqueness: true
  end

  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
    with_options numericality: true do
      validates :insta_follower, format: { with: /\A[0-9０-９]{5,}\z/ }
      validates :insta_man, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_woman, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age1, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age2, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age3, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age4, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age5, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age6, format: { with: /\A[0-9０-９]+\z/ }
      validates :insta_age7, format: { with: /\A[0-9０-９]+\z/ }
    end
    with_options numericality: { other_than: 0 } do
      validates :category_id
    end
  end
end
