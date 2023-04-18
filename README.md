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

- has_many :sales_histories
- has_many :items


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | int        | null: false                    |
| item_condition_id   | int        | null: false                    |
| shipping_price_id   | int        | null: false                    |
| prefecture_id       | int        | null: false                    |
| shipping_date_id    | string     | null: false                    |
| price               | int        | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one  :sales_history


## addresses テーブル　発送先住所

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | int        | null: false                    |
| city            | string     | null: false                    |
| street          | string     | null: false                    |
| building_name   | string     |                                |
| phone_num       | string     | null: false                    |
| sales_history   | references | null: false, foreign_key: true |

### Association

- belongs_to :sales_history

## sales_histories テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- has_one    :address
- belongs_to :user
- belongs_to :item
