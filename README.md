# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_first         | string | null: false               |
| name_last          | string | null: false               |
| name_first_kana    | string | null: false               |
| name_last_kana     | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type       | Options                        |
| ----------------  | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| item_info         | text       | null: false                    |
| category_id       | integer    | null: false                    |
| item_condition_id | integer    | null: false                    |
| delivery_cost_id  | integer    | null: false                    |
| delivery_area_id  | integer    | null: false                    |
| delivery_days_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


## delivers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_num      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| number        | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase



## purchasesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase