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
- has_many :buy_histories



##  items テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| name          | string      | null: false                    |
| price         | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |
| explain       | text        | null: false                    |
| category_id   | integer     | null: false                    |
| status_id     | integer     | null: false                    |
| cost_id       | integer     | null: false                    |
| prefecture_id | integer     | null: false                    |
| by_send_id    | integer     | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :buy_history





##  buy_histories テーブル

| Column   | Type        | Options                        |
| ---------| ----------- | ------------------------------ |
| user     | references  | null: false, foreign_key: true |
| item     | references  | null: false, foreign_key: true |

- belongs_to :user
- has_one :address
- belongs_to :item








##  addresses テーブル

| Column             | Type        | Options                        |
| ------------------ | ------------| ------------------------------ |
| post_code          | string      | null: false                    |
| prefecture_id      | integer     | null: false                    |
| city               | string      | null: false                    |
| address            | string      | null: false                    |
| building_name      | string      |                                |
| phone_number       | string      | null: false                    |
| buy_history        | references  | null: false, foreign_key: true |
  

### Association

- has_many :comments
- belongs_to :buy_history





## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address
- belongs_to :item