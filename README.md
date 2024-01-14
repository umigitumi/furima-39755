# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | text   | null: false |
| password           | text   | null: false |
| encrypted_password | text   | null: false |

### Association

- has_many :items
- has_many :delivers
- has_many :purchases


## items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| name            | string       | null: false                    |
| image           | string       | null: false                    |
| category        | text         | null: false                    |
| price           | text         | null: false                    |
| delivery_cost   | text         | null: false                    |
| item_condition  | text         | null: false                    |
| item_info       | text         | null: false                    |
| item_days       | text         | null: false                    |
| user_id         | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :delivers
- has_one    :purchases


## delivers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_num      | text       | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| number        | text       | null: false                    |
| building      | string     | null: false                    |
| phone         | text       | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| items_id      | references | null: false, foreign_key: true |


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
| user_id       | references | null: false, foreign_key: true |
| items_id      | text       | null: false, foreign_key: true |
| delivers_id   | text       | null: false, foreign_key: true |



### Association

- belongs_to :users
- belongs_to :items
- belongs_to :purchases