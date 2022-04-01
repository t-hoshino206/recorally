## usersテーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| avatar             | string     |                           |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |


### Association

- has_many :cards


## cardsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :playlogs
- has_many :places


## placesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | string     | null: false                    |
| menu          | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| address       | string     | null: false                    |
| map           | string     |                                |
| card          | references | null: false, foreign_key: true |


### Association

- belongs_to :card
- has_many :playlogs


## playlogsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card          | references | null: false, foreign_key: true |
| place         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :card
- belongs_to :place
- belongs_to :user