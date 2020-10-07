# README

# テーブル設計

## users テーブル

| Column          | Type       | Options                        |
| ----------------| ---------  | ------------------------------ |
| nickname        | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| kana_last_name  | string     | null: false                    |
| kana_first_name | string     | null: false                    |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| company         | string     |                                |
| account         | string     |                                |
| profile         | references | null: false, foreign_key: true |

### Association

- has_one :profile
- has_one :category

## profile テーブル

| Column                   | Type       | Options                        |
| -------------------------| ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| explanation              | text       | null: false                    |
| insta_follower           | integer    | null: false                    |
| insta_man                | integer    | null: false                    |
| insta_woman              | integer    | null: false                    |
| insta_age1               | integer    | null: false                    |
| insta_age2               | integer    | null: false                    |
| insta_age3               | integer    | null: false                    |
| insta_age4               | integer    | null: false                    |
| insta_age5               | integer    | null: false                    |
| insta_age6               | integer    | null: false                    |
| insta_age7               | integer    | null: false                    |
| insta_reach              | integer    | null: false                    |
| insta_impression         | integer    | null: false                    |
| insta_click              | integer    | null: false                    |
| youtube_follower         | integer    |                                |
| youtube_man              | integer    |                                |
| youtube_woman            | integer    |                                |
| youtube_age1             | integer    |                                |
| youtube_age2             | integer    |                                |
| youtube_age3             | integer    |                                |
| youtube_age4             | integer    |                                |
| youtube_age5             | integer    |                                |
| youtube_age6             | integer    |                                |
| youtube_age7             | integer    |                                |
| viewing                  | integer    |                                |

| twitter_follower         | integer    |                                |
| twitter_man              | integer    |                                |
| twitter_woman            | integer    |                                |
| twitter_age1             | integer    |                                |
| twitter_age2             | integer    |                                |
| twitter_age3             | integer    |                                |
| twitter_age4             | integer    |                                |
| twitter_age5             | integer    |                                |
| twitter_age6             | integer    |                                |
| twitter_age7             | integer    |                                |
| twitter_impression       | integer    |                                |
| twitter_engagement       | integer    |                                |
| twitter_click            | integer    |                                |
| category_id              | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :category

## category テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| profile | references | null: false, foreign_key: true |

### Association

- belongs_to :profile
- belongs_to :user


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
