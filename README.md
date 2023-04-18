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
| category_id         | references | null: false  foreign_key: true |
| item_condition_id   | references | null: false, foreign_key: true |
| shipping_price      | string     | null: false,                   |
| shipping_area       | string     | null: false,                   |
| shipping_date       | string     | null: false,                   |
| price               | int        | null: false,                   |

### Association

- belongs_to :user
- has_one  :category
- has_one  :item_condition


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture      | string     | null: false,                   |
| city            | string     | null: false,                   |
| street          | string     | null: false,                   |
| building_name   | string     |                                |
| phone_num       | int        | null: false,                   |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## categories テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| category_name   | string     | null: false                    |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## item_conditions テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| condition       | string     | null: false                    |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
