# テーブル設計

## usersテーブル

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| nickname            | string     | null: false               |
| email               | string     | null: false               |
| password            | string     | null: false               |
| first_name          | string     | null: false               |
| last_name           | string     | null: false               |
| first_name_kana     | string     | null: false               |
| last_name_kana      | string     | null: false               |
| birthday            | string     | null: false               |


### Association
- has_many :product
- has_many :orders

## productテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category           | integer    | null: false                    |
| price              | integer    | null: false                    |
| image              | string     | null: false                    |
| condition          | integer    | null: false                    |
| delivery_cost      | integer    | null: false                    |
| sales_commission   | integer    | null: false                    |
| sales_profit       | integer    | null: false                    |
| prefecture         | integer    | null: false                    |
| shipping_date      | integer    | null: false                    |


### Association
- belongs_to :users
- has_one :orders

## ordersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :product
- has_one :shipping information

## shipping informationテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| orders              | references | null: false, foreign_key: true |
| post_code           | string     | null: false                    |
| prefectures         | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| street_address      | string     | null: false                    |
| building_name       | string     | null: false                    |
| phone_number        | string     | null: false                    |


### Association
- has_one :orders
