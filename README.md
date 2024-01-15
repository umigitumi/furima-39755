# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | text   | null: false |
| password           | text   | null: false |
| encrypted_password | text   | null: false |
| name_1             | string | null: false |
| name_2             | string | null: false |
| name_1_kana        | string | null: false |
| name_2_kana        | string | null: false |
| birthday_year      | integer| null: false |
| birthday_month     | integer| null: false |
| birthday_day       | integer| null: false |


### Association

- has_many :items
- has_many :delivers
- has_many :purchases


## items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| name            | string       | null: false                    |
| category_id     | integer      | null: false                    |
| price           | integer      | null: false                    |
| users           | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :delivers
- has_one    :purchases


## delivers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_num      | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| number        | text       | null: false                    |
| building      | string     |                                |
| phone         | text       | null: false                    |
| users         | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items
- has_many   :purchases



## purchases
 テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | string     | null: false                    |
| item          | text       | null: false                    |
| users         | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |
| delivers      | references | null: false, foreign_key: true |



### Association

- belongs_to :users
- belongs_to :items
- belongs_to :purchases