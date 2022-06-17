# README

# usersテーブル

| Column                          | Type    | Options                   |
| ------------------------------- | ------- | ------------------------- |
| nickname                        | string  | null: false               |
| email                           | string  | null: false, unique: true |
| encrypted_password              | string  | null: false               |
| last_name                       | string  | null: false               |
| first_name                      | string  | null: false               |
| last_name_katakana              | string  | null: false               |
| first_name_katakana             | string  | null: false               |
| date_of_birth                   | date    | null: false               |

# Association

- has_many :products
- has_many :buys

# productsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_state_id      | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| selling_price      | integer    | null: false                    | 
| user               | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- has_one :buy

# buysテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- belongs_to :product
- has_one :shopping_address

# shopping_addressテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| area_id        | integer    | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: flase                    |
| buy            | references | null: false, foreign_key: true |

- belongs_to :buy