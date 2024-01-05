# テーブル設計

## usersテーブル

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| nickname            | string     | null: false               |
| email               | string     | null: false,unique: true  |
| encrypted_password  | string     | null: false               |
| first_name          | string     | null: false               |
| last_name           | string     | null: false               |
| first_name_kana     | string     | null: false               |
| last_name_kana      | string     | null: false               |
| birthday            | date       | null: false               |


### Association
- has_many :products
- has_many :orders

## productテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |


### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :product
- has_one :shipping_information

## shipping_informationテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| order               | references | null: false, foreign_key: true |
| post_code           | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| street_address      | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |


### Association
- has_one :order
