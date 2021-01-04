# README

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




## users table
| Column             | Type    | Options    |
| ------------------ | ------- | ---------- |
| username           | string  | null:false |
| encrypted_password | string  | null:false |
| email              | string  | null:false |
| first_name         | string  | null:false |
| last_name          | string  | null:false |
| first_name_kana    | string  | null:false |
| last_name_kana     | string  | null:false |
| birthday           | date    | null:false |

## association
- has_many :items
- has_many :trading_records



## items table
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item_name          | string     | null:false                    |
| introduction       | text       | null:false                    |
| category_id        | integer    | null:false foreign_key: true  |
| item_condition_id  | integer    | null:false, foreign_key: true |
| postage_payer_id   | integer    | null:false, foreign_key: true |
| prefecture_code_id | integer    | null:false, foreign_key: true |
| preparation_day_id | integer    | null:false, foreign_key: true |
| price              | integer    | null:false                    |
| user               | references | null:false, foreign_key: true |

## association
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :category
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to :user
- has_one :trading_records


## trading_records table
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| item   | references | null:false, foreign_key: true |
| user   | references | null:false, foreign_key: true |

 ## association
- belongs_to :users
- belongs_to ：items
- has_one :sending_destination



## sending_destinations table
| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| post_code       | string(7)  | null:false                    |
| prefecture_code | string     | null:false                    |
| city            | string     | null:false                    |
| house_number    | string     | null:false                    |
| building_name   | string     |                               |
| phone_number    | integer    | null:false                    |
| user            | references | null:false, foreign_key: true |
 
 ## association
- belongs_to :user
- belongs_to :trading_records

