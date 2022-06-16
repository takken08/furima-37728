# README

# usersテーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| mail                  | string | null: false, unique: true |
| password              | string | null: false               |
| password_confirmation | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_katakana    | string | null: false               |
| first_name_katakana   | string | null: false               |

# Association

- has_many :products
- has_many :comments
- has_one :buy

# productsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| itemname        | text       | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| item_state      | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| area            | string     | null: false                    |
| delivery_days   | string     | null: false                    |
| selling_price   | string     | null: false                    | 
| user_id         | references | null: false, foreign_key: true |

# Association

- has_many :comments
- belongs_to :user
- has_one :buy

# buyテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- belongs_to :product
- has_one :shopping_address

# shopping_addressテーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_code      | string  | null: false |
| prefectures    | string  | null: false |
| municipalities | string  | null: false |
| house_number   | string  | null: false |
| building_name  | string  |             |
| phone_number   | integer | null: flase |

- belongs_to :buy