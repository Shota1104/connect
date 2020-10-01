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
| insta_gender             | integer    | null: false                    |
| insta_age                | integer    | null: false                    |
| youtube_follower         | integer    |                                |
| youtube_gender           | integer    |                                |
| youtube_age              | integer    |                                |
| viewing                  | integer    |                                |
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
