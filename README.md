# アプリケーション名
tabealook（タベアルック）

# アプリケーション概要
おすすめの外食ごはん・スイーツを気軽にシェアし、ユーザー同士でコミュニケーションをとることができる。
スタンプラリー形式にすることで、ゲーム感覚で楽しむことができる。

# URL
https://recorally.herokuapp.com/

# テスト用アカウント
<ul>
  <li>Basic認証ID：recorally</li>
  <li>Basic認証パスワード：37588</li>
  <li>メールアドレス：test01@test.co.jp</li>
  <li>パスワード：test01</li>
</ul>

# 利用方法

## スタンプカードを作成する
1. トップページからユーザー新規登録を行う
2. カード作成ボタンから、共有したい情報を入力し作成する。
3. 必要に応じておすすめメニューを「メニュー追加」ボタンから追加する

## スタンプラリーを楽しむ
1. ホーム画面のスタンプカード一覧から、プレイしたいカードを選択する
2. 各おすすめメニューの「詳細」ボタンから、詳細ページに進む
3. お店を訪れおすすめメニューを食べたら「スタンプを押す」ボタンを押す

# アプリケーションを作成した背景

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1xp8unMI8xZ1gxdxHfx-YYX8BdA-iDF0M30uJ8dubrlw/edit#gid=1650945082)

## usersテーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| avatar             | string     |                           |
| header             | string     |                           |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |


### Association

- has_many :cards
- has_many :playlogs


## cardsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
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
| place         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :place
- belongs_to :user