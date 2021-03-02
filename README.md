# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buyers



##  items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| price    | integer    | null: false                    |
| user_id  | references | null: false, foreign_key: true |
| image    | string     | null: false                    |
| explain  | string     | null: false                    |
| category | string     | null: false                    |
| state    | string     | null: false                    |
| cost     | string     | null: false                    |
| area     | string     | null: false                    |
| by_send  | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :buyer
- has_many :comments




##  buyers テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| post_code          | string  | null: false |
| prefecture         | string  | null: false |
| city               | string  | null: false |
| address            | string  | null: false |
| building_name      | string  | null: false |
| phone_number       | string  | null: false |
  

### Association

- belongs_to :user
- has_many :items
- has_many :comments





## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer
- belongs_to :item