# テーブル設計

## users テーブル

| Column              | Type   | Option                    |
| ------------------  | ------ | ------------------------- |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| nickname            | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_name_katakana | string | null: false               |
| last_name_katakana  | string | null: false               |
| birthday            | string | null: false               |

### Association

- has_many :items
- has_many :buy_addresses, through: :user_buy_addresses


## items テーブル

| Column             | Type      | Option      |
| ---------------    | -------   | ----------- |
| name               | string    | null: false |
| image              |           | null: false |
| concept            | text      | null: false |
| category_id        | integer   | null: false |
| item_status_id     | integer   | null: false |
| idelivery_price_id | integer   | null: false |
| delivery_price_id  | integer   | null: false |
| delivery_date_id   | integer   | null: false |
| price              | int       | null: false |

### Association

- belongs_to :user
- has_many :buy_address



## user_buy_address テーブル

| Column      | Type       | Option                         |
| ----------  | ---------- | ------------------------------ |
| use         | references | null: false, foreign_key: true |
| buy_address | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :buy_address

## buy_address

| Column        | Type          | Option                         |
| ------------  | ------------- | --------------------------     |
| address_line  | string        | null: false                    |
| pregecture_id | integer       | null: false                    |
| city          | string        | null: false                    |
| block_number  | string        | null: false                    |
| city_bill     | string        |                                |
| phone_number  | string        | null: false                    |
| user          | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :users, through: :user_buy_addresses