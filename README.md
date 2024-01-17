# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_1             | string | null: false               |
| name_2             | string | null: false               |
| name_1_kana        | string | null: false               |
| name_2_kana        | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| category_id     | integer    | null: false                    |
| category_info   | text       | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


## delivers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_num      | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| number        | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_many   :purchases



## purchasesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| user          | string     | null: false |
| item          | string     | null: false |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase