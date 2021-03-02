# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | date    | null: false               |


### Association

- has_many :items
- has_many :comments
- has_many :buyers
- has_many :historys



##  items テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| name        | string      | null: false                    |
| price       | integer     | null: false                    |
| user        | references  | null: false, foreign_key: true |
| explain     | string      | null: false                    |
| category_id | integer     | null: false                    |
| status_id   | integer     | null: false                    |
| cost_id     | integer     | null: false                    |
| area_id     | integer     | null: false                    |
| by_send_id  | integer     | null: false                    |

### Association

- belongs_to :user
- belongs_to :buyer
- has_many :comments
- has_many :historys





##  history テーブル

| Column   | Type        | Options                        |
| ---------| ----------- | ------------------------------ |
| buyer    | references  | null: false, foreign_key: true |
| item     | references  | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :buyer
- belongs_to :item








##  buyers テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
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
- has_many :historys





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