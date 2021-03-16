# テーブル設計

## users テーブル

| Column     | Type   | Option      |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |

### Association

- has_many :items
- has_one :personal
- has_many :buys

## personal

| Column              | Type   | Option      |
| ------------------- | ------ | ----------- |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_katakana | string | null: false |
| last_name_katakana  | string | null: false |
| birthday            | string | null: false |

### Association

- has_one :user

## items テーブル

| Column          | Type          | Option      |
| ------------    | ------------- | ----------- |
| item_name       | string        | null: false |
| image           | ActiveStorage | null: false |
| concept         | text          | null: false |
| category        | string        | null: false |
| item_status     | string        | null: false |
| idelivery_price | string        | null: false |
| delivery_price  | string        | null: false |
| delivery_date   | string        | null: false |
| item_price      | string        | null: false |

### Association

- belongs_to :user
- has_many :buy_items
- has_many :buy_address

## buy テーブル

| Column                 | Type   | Option      |
| -----------------      | ------ | ----------- |
| creditcard_number      | string | null: false |
| card_deadline          | string | null: false |
| security_number        | string | null: false |

### Association

- belongs_to :user
- has_many :buy_item
- has_one :buy_address

## buy_items テーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| buy        | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :buy

## buy_address

| Column       | Type          | Option      |
| ------------ | ------------- | ----------- |
| address_line | string        | null: false |
| pregecture   | string        | null: false |
| city         | string        | null: false |
| city2        | string        | null: false |
| city_bill    | string        |             |
| phone_number | string        | null: false |


### Association

- has_one :buy