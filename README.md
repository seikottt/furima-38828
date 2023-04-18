# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------  | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| first_name_kana      | string | null: false               |
| last_name_kana       | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :item
- has_one  :address

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | int        | null: false  foreign_key: true |
| item_condition_id   | int        | null: false, foreign_key: true |
| shipping_price_id   | int        | null: false, foreign_key: true |
| prefecture_id       | int        | null: false, foreign_key: true |
| shipping_date_id    | string     | null: false, foreign_key: true |
| price               | int        | null: false,                   |
| user_id             | int        | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one  :sales_history


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | int        | null: false, foreign_key: true |
| city            | string     | null: false,                   |
| street          | string     | null: false,                   |
| building_name   | string     |                                |
| phone_num       | int        | null: false,                   |
| user_id         | int        | null: false, foreign_key: true |

### Association

- belongs_to :user

## sales_history テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | int        | null: false, foreign_key: true |
| item_id          | int        | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
